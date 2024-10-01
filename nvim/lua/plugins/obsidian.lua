local vault_path = vim.fn.expand '~/Personal/notes'

return {
  'epwalsh/obsidian.nvim',
  enabled = false, -- TODO: Remove when ready.
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = false,
  -- ft = 'markdown',
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  event = {
    'BufReadPre ' .. vault_path .. '/**.md',
    'BufNewFile ' .. vault_path .. '/**.md',
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {
    workspaces = {
      {
        name = 'personal',
        -- TODO: Use a dynamic workspace that detects a Git repo with .obsidian/ subdir.
        path = vault_path,
      },
    },

    notes_subdir = 'thoughts',

    daily_notes = {
      folder = 'daily',
      template = 'daily.md',
    },

    templates = {
      folder = 'templates',
    },

    -- Plugin adds some custom frontmatter like id, aliases, and tags.
    -- I don't use them, so remove default frontmatter and rely on templates instead.
    note_frontmatter_func = function(note)
      -- Add the title of the note as an alias.
      if note.title then
        note:add_alias(note.title)
      end

      local out = {}

      -- `note.metadata` contains any manually added fields in the frontmatter.
      -- So here we just make sure those fields are kept in the frontmatter.
      if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
        for k, v in pairs(note.metadata) do
          out[k] = v
        end
      end
      return out
    end,
  },
}
