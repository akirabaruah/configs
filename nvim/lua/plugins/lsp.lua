return {
  'neovim/nvim-lspconfig',
  name = 'lspconfig',
  lazy = false, -- TODO: Remove this and load on buffer entry.
  keys = {
    { 'K', vim.lsp.buf.hover, desc = 'Hover documentation' },
    { '<leader>ca', vim.lsp.buf.code_action, desc = 'Code Action' },
    -- TODO: Add function to list methods and their documentation (in Telescope?).
  },
  config = function(plugin)
    local lspconfig = require(plugin.name)
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    local default_config = { capabilities = capabilities }

    -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
    -- TODO: Iterate over a list of language servers.
    -- TODO: Add fidl LSP server.
    lspconfig.lua_ls.setup(default_config)
    lspconfig.rust_analyzer.setup(default_config)
    lspconfig.nushell.setup(default_config)
  end,
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',

    -- Useful status updates for LSP.
    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    { 'j-hui/fidget.nvim', opts = {} },

    -- `neodev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    { 'folke/neodev.nvim', opts = {} },
  },
}
