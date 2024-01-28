return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    flavour = "macchiato",
  },
  config = function(plugin)
    -- Default 
    require(plugin.name).setup(plugin.opts)
    vim.cmd.colorscheme("catppuccin")
  end
}
