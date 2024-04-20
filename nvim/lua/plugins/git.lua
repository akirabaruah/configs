return {
  { -- Git wrapper for Neovim. Fugitive reminds me of Magit from Emacs.
    'tpope/vim-fugitive',
    keys = {
      { '<leader>gg', vim.cmd.Git, desc = 'Git (Fugitive)' },
      { '<leader>gb', '<cmd>Git blame<cr>', desc = 'Git blame' },
      { '<leader>gp', '<cmd>Git pull<cr>', desc = 'Git pull' },
      { '<leader>gP', '<cmd>Git push<cr>', desc = 'Git push' },

      -- Custom keymaps for the Fugitive buffer.
      { '<Tab>', '=', ft = 'fugitive', remap = true, desc = 'Toggle inline diff at cursor' },
      { 'q', vim.cmd.quit, ft = { 'fugitive', 'fugitiveblame' }, desc = 'Quit Fugitive' },
    },
  },
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },
}
