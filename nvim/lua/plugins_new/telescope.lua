return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  event = 'VimEnter',
  keys = function()
    local builtin = require 'telescope.builtin'
    local live_grep_args = require('telescope').extensions.live_grep_args.live_grep_args
    return {
      -- Buffers
      { '<leader><leader>', builtin.buffers, desc = 'List buffers' },
      -- TODO: Search content of open buffers
      -- TODO: Previous buffer
      -- TODO: Delete buffer (maybe using list)

      -- Files
      { '<leader>ff', builtin.find_files, desc = 'Find files' },
      { '<leader>f/', live_grep_args, desc = 'Search file content' },
      { '<leader>fo', builtin.oldfiles, desc = 'Recent (old) files' },
      -- TODO: New file
      -- TODO: Delete file (maybe using list)

      -- Git
      { '<leader>gb', builtin.git_branches, desc = 'Git branches' },
      { '<leader>gl', builtin.git_bcommits, desc = 'Git log for current buffer' },
      { '<leader>gL', builtin.git_commits, desc = 'Git log for repo' },
    }
  end,
  opts = function()
    local action_generate = require 'telescope.actions.generate'
    return {
      defaults = {
        i = {
          -- This help menu is already mapped to "?" in Normal mode.
          ['C-/'] = action_generate.which_key {},
        },
      },
      pickers = {
        buffers = {
          sort_mru = true, -- Sort buffers in most recently used order.
          mappings = {
            i = {
              ['<C-k>'] = require('telescope.actions').delete_buffer,
            },
          },
        },
      },
      extensions = {
        live_grep_args = {
          auto_quoting = true,
          mappings = {
            i = {
              ['<C-g>'] = require('telescope-live-grep-args.actions').quote_prompt { postfix = ' --iglob ' },
            },
          },
        },
      },
    }
  end,
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-live-grep-args.nvim',
      -- This will not install any breaking changes.
      -- For major updates, this must be adjusted manually.
      version = '^1.0.0',
    },
    {
      'nvim-telescope/telescope-fzf-native.nvim',

      -- Run only upon telescope install or update, if `make` is available.
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
  },
}
