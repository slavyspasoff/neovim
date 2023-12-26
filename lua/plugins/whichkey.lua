local config = function()
  local wk = require("which-key")
  wk.register({
    ["<leader>"] = {
      { c = { name = "Code" } },
      { b = { name = "Buffer" } },
      { e = { name = "Explorer" } },
      { f = { name = "Find" } },
      { q = { name = "Quit" } },
      { s = { name = "Surround" } },
    },
    g = { name = "Go to", {
      T = { name = "Type Definition" },
    } },
  })
end

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = config,
}
