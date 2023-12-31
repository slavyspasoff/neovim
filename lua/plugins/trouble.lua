return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  opts = {
    height = 8,
  },
  keys = {
    {
      "<leader>et",
      function()
        require("trouble").toggle()
      end,
      desc = "Trouble",
    },
  },
}
