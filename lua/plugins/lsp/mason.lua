local config = function()
  local mason = require("mason")
  local mason_lspconfig = require("mason-lspconfig")
  local mason_tool_installer = require("mason-tool-installer")

  local lsp_servers = {
    "bashls",
    "jdtls",
    "jsonls",
    "lua_ls",
    "pyright",
    "tsserver",
    "yamlls",
  }

  local lint_and_format_servers = {
    --lint
    "eslint_d",
    "flake8",
    --format
    "black",
    "goimports",
    "isort",
    "prettierd",
    "stylua",
    "shfmt",
  }

  mason.setup({
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
  })

  mason_lspconfig.setup({
    ensure_installed = lsp_servers,
  })

  mason_tool_installer.setup({
    ensure_installed = lint_and_format_servers,
  })
end

return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = config,
  lazy = false,
}
