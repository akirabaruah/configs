return { -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    -- https://github.com/nushell/tree-sitter-nu/blob/main/installation/neovim.md
    { 'nushell/tree-sitter-nu', build = ':TSUpdate nu' },
  },
  build = ':TSUpdate',
  opts = {
    auto_install = true,
    ensure_installed = {
      'bash',
      'c',
      'fidl',
      'html',
      'lua',
      'luadoc',
      'markdown',
      'vim',
      'vimdoc',
    },
    highlight = {
      enable = true,
      -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
      --  If you are experiencing weird indenting issues, add the language to
      --  the list of additional_vim_regex_highlighting and disabled languages for indent.
      additional_vim_regex_highlighting = { 'ruby' },
    },
    indent = { enable = true, disable = { 'ruby' } },
  },
  config = function(_, opts)
    -- Prefer git instead of curl in order to improve connectivity in some environments
    require('nvim-treesitter.install').prefer_git = true
    ---@diagnostic disable-next-line: missing-fields
    require('nvim-treesitter.configs').setup(opts)

    vim.filetype.add { extension = { fidl = 'fidl' } }
  end,
}
