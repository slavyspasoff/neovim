local config = function()
  local nvim_tree = require("nvim-tree")

  nvim_tree.setup({
    disable_netrw = true,
    git = {
      ignore = false,
    },
    renderer = {
      indent_markers = {
        enable = false,
      },
      icons = {
        glyphs = {
          git = {
            unstaged = "",
          },
        },
      },
    },
    view = {
      side = "right",
      width = 30,
    },
  })
end

local keys = { { "<leader>ee", ":NvimTreeToggle<CR>", desc = "Nvim Tree" } }

return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  keys = keys,
  config = config,
}
