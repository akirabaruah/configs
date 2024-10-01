return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  config = function() -- Runs after loading this plugin.
    require('which-key').setup()
    require('which-key').register {
      ['<leader>f'] = { name = '[F]ile', _ = 'which_key_ignore' },
      ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
    }
  end,
}
