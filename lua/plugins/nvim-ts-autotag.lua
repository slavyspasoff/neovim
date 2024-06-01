local opts = {
  enable_close = true,
  enable_rename = true,
  enable_close_on_slash = false,
}

local config = function()
  require("nvim-ts-autotag").setup({
    opts,
  })
end

return {
  "windwp/nvim-ts-autotag",
  lazy = false,
  config = config,
}
