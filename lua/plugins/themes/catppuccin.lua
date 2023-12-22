local config = function()
  local colorscheme = "catppuccin-mocha"
  vim.cmd("colorscheme " .. colorscheme)
end

return {
  "catppuccin/nvim",
  name = "catppuccin",
  config = config,
  lazy = false,
  priority = 1000
}
