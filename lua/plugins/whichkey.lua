local config = function()
  local wk = require("which-key")
  wk.register({
    ["<leader>"] = {
      { b = { name = "Buffer" } },
      { e = { name = "Explorer" } },
      { f = { name = "Find" } },
      { l = { name = "Linting and Formatting" } },
      { q = { name = "Quit" } },
    },
    g = { name = "Go to" },
  })
end

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = config,
}
