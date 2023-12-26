local config = function()
  require("rainbow-delimiters.setup").setup({
    highlight = {
      "RainbowDelimiterOrange",
      "RainbowDelimiterViolet",
      "RainbowDelimiterBlue",
      "RainbowDelimiterCyan",
    },
  })
end

return {
  "hiphish/rainbow-delimiters.nvim",
  lazy = false,
  config = config,
}
