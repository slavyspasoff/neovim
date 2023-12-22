local config = function()
  local telescope = require("telescope")

  telescope.load_extension("fzf")

  telescope.setup({
    defaults = {
      selection_caret = " ",
    },
  })
end

local keys = {
  { "<leader>ff", ":Telescope find_files<CR>", desc = "Find Files" },
  { "<leader>fg", ":Telescope live_grep<CR>", desc = "Live Grep" },
  { "<leader>fb", ":Telescope buffers<CR>", desc = "Open Buffers" },
  { "<leader>fs", ":Telescope grep_string<CR>", desc = "Search String" },
  { "<leader>fo", ":Telescope oldfiles<CR>", desc = "Recent Files" },
}

return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
  lazy = false,
  config = config,
  keys = keys,
}
