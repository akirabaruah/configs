return {
  "projekt0n/github-nvim-theme",
  name = "github-theme",
  priority = 1000,
  config = function(plugin)
    require(plugin.name).setup(plugin.opts)
    vim.cmd.colorscheme("github_dark")
  end
}
