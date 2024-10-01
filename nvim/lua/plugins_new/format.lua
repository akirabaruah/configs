return { -- Autoformat
  {
    'mfussenegger/nvim-lint',
    main = 'lint',
    opts = {
      events = { 'BufWritePost', 'BufReadPost', 'InsertLeave' },
      linters_by_ft = {
        python = { 'pylint' },
      },
    },
    config = function(plugin)
      local lint = require(plugin.main)
      lint.linters_by_ft = plugin.opts.linters_by_ft
    end,
  },
  {
    'stevearc/conform.nvim',
    main = 'conform',
    lazy = false,
    keys = {
      {
        '<leader>F',
        function()
          require('conform').format { async = true, lsp_fallback = true }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = {}
        return {
          timeout_ms = 500,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        -- javascript = { { "prettierd", "prettier" } },
      },
    },
    config = function(plugin)
      require(plugin.main).setup(plugin.opts)

      local format_group = vim.api.nvim_create_augroup('Format', { clear = false })

      local function preserve_cursor(cmd)
        return function()
          local pos = vim.fn.getpos '.'
          vim.cmd(cmd)
          vim.fn.setpos('.', pos)
        end
      end

      vim.api.nvim_create_autocmd('BufWritePre', {
        desc = 'Remove trailing whitespace',
        group = format_group,
        pattern = '*',
        callback = preserve_cursor [[%s/\s\+$//e]],
      })

      vim.api.nvim_create_autocmd('BufWritePre', {
        desc = 'Remove consecutive blank lines',
        group = format_group,
        pattern = '*',
        -- Regex `\%(` ignores the content for better performance.
        callback = function()
          -- Python PEP-8 style uses double blank lines.
          if vim.bo.filetype == 'python' then
            return
          end
          local f = preserve_cursor [[%s/\%(\s*\n\)\{3,}/\r\r/e]]
          f()
        end,
      })

      vim.api.nvim_create_autocmd('BufWritePre', {
        desc = 'Remove blank lines at end of file',
        group = format_group,
        pattern = '*',
        callback = preserve_cursor [[%s/\%(\s*\n\)*\%$//e]],
      })
    end,
  },
}
