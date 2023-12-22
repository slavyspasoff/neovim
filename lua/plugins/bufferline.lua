return {
  "akinsho/bufferline.nvim",
  lazy = false,
  opts = {
    options = {
      -- diagnostics = "nvim_lsp",
      -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
      --   local icons = {
      --     Error = " ",
      --     Warn = " ",
      --     Hint = " ",
      --     Info = " ",
      --   }
      --   local status = diagnostics_dict.error and icons.Error or diagnostics_dict.warning and icons.Warn or ""
      --   return vim.trim(status)
      -- end,
      always_show_bufferline = true,
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          text_align = "center",
          separator = true,
        },
      },
    },
  },
}
