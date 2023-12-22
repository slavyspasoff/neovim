local config = function()
  local conform = require("conform")

  local servers = {
    lua = { "stylua" },
    go = { "gofmt" },
    javascript = { "prettierd" },
    typescript = { "prettierd" },
    javascriptreact = { "prettierd" },
    typescriptreact = { "prettierd" },
    json = { "prettierd" },
    yaml = { "prettierd" },
    markdown = { "prettierd" },
    graphql = { "prettierd" },
    python = { "isort", "black" },
  }

  conform.setup({
    formatters_by_ft = servers,
    format_on_save = {
      timeout_ms = 1000,
      lsp_fallback = true,
      async = false,
    },
    notify_on_error = true,
  })
end

local keys = {
  {
    "<leader>lp",
    function()
      require("conform").format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end,
    desc = "Format Current Buffer",
  },
}

return {
  "stevearc/conform.nvim",
  lazy = false,
  keys = keys,
  config = config,
}
