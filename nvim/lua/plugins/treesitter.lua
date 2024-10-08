return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      -- TODO: This plugin's build step seems broken on initial load.
      -- https://github.com/nushell/tree-sitter-nu/blob/main/installation/neovim.md
      { 'nushell/tree-sitter-nu', build = ':TSUpdate nu' },
    },
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs', -- Sets main module to use for opts
    init = function()
      vim.filetype.add { extension = { fidl = 'fidl' } }
    end,
    opts = {
      auto_install = true,
      ensure_installed = {
        'bash',
        'c',
        'diff',
        'fidl', -- TODO: Only install when entering buffer with filetype fidl.
        'html',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'query',
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
  },
}
