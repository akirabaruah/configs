return {
  'nvim-tree/nvim-tree.lua',
  lazy = true,
  keys = {
    { '<leader>ft', '<cmd>NvimTreeToggle<cr>', desc = 'Toggle file tree' },
  },
  init = function()
    vim.g.nvim_tree_show_icons = {
      git = 0,
      folders = 0,
      files = 0,
      folder_arrows = 0,
    }
  end,
  -- See DEFAULT_OPTS in https://github.com/nvim-tree/nvim-tree.lua/blob/master/lua/nvim-tree.lua
  opts = {
    renderer = {
      icons = {
        git_placement = 'after',
        glyphs = {
          default = '-',
          symlink = 'S',
          bookmark = 'B',
          modified = 'M',
          folder = {
            arrow_closed = '›',
            arrow_open = '⌄',
            default = 'D',
            open = 'D',
            empty = 'd',
            empty_open = 'd',
            symlink = 'S',
            symlink_open = 'S',
          },
          git = {
            unstaged = '✗',
            staged = '✓',
            unmerged = 'U',
            renamed = '➜',
            untracked = '★',
            deleted = 'D',
            ignored = '◌',
          },
        },
      },
    },
  },
}
