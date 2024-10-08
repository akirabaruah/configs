return {
  -- Auto completion.
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    opts = function()
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      return {
        mapping = {
          ['<CR>'] = cmp.mapping.confirm { select = true },
          ['<Tab>'] = cmp.mapping.confirm { select = true },
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),

          -- Expand snippet or navigate left and right.
          -- If you have a snippet like:
          --   function $name($args)
          --     $body
          --   end
          -- <C-l> moves to the next expansion location.
          -- <C-h> moves to the previous location.
          ['<C-l>'] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { 'i', 's' }),
          ['<C-h>'] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { 'i', 's' }),
        },

        -- Snippet engine is required by nvim-cmp plugin.
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },

        -- Activate completion sources.
        sources = {
          { name = 'luasnip' },
          { name = 'nvim_lsp' },
          { name = 'path' },
        },
      }
    end,
    dependencies = {
      -- Snippet engine.
      {
        'L3MON4D3/LuaSnip',
        version = 'v2.*',
        build = 'make install_jsregexp', -- Optional.
      },

      -- Completion sources.
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
    },
  },

  -- Auto pairing for brackets and quotes.
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {},
  },
}
