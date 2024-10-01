return {
  -- Color scheme.
  {
    'projekt0n/github-nvim-theme',
    name = 'github-theme',
    priority = 1000,
    config = function(plugin)
      require(plugin.name).setup(plugin.opts)
      vim.cmd.colorscheme 'github_dark'
    end,
  },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', lazy = false },

  -- Highlight todo, notes, etc in comments
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
}
