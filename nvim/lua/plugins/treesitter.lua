return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function () 
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "c",
        "cpp",
        "go",
        "html",
        "javascript",
        "lua",
        "python",
        "typescript",
        "vim",
        "vimdoc",
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },  
    })
  end,
}
