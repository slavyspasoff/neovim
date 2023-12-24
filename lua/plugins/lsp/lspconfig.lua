local config = function()
  local lspconfig = require("lspconfig")
  local cmp_nvim_lsp = require("cmp_nvim_lsp")

  local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }

  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end

  local capabilities = cmp_nvim_lsp.default_capabilities()

  local on_attach = function(client, buffnr)
    local keymap = vim.keymap.set
    local telescope = require("telescope.builtin")

    -- HACK: https://github.com/golang/go/issues/54531#issuecomment-1464982242
    -- TODO: Remove when resolved
    if client.name == "gopls" and not client.server_capabilities.semanticTokensProvider then
      local semantic = client.config.capabilities.textDocument.semanticTokens
      client.server_capabilities.semanticTokensProvider = {
        full = true,
        legend = { tokenModifiers = semantic.tokenModifiers, tokenTypes = semantic.tokenTypes },
        range = true,
      }
    end

    keymap("n", "gr", function()
      telescope.lsp_references()
    end, { noremap = true, silent = true, buffer = buffnr, desc = "Reference" })
    keymap("n", "gd", function()
      telescope.lsp_definitions({ reuse_win = true })
    end, { noremap = true, silent = true, buffer = buffnr, desc = "Definitions" })
    keymap("n", "gi", function()
      telescope.lsp_implementations({ reuse_win = true })
    end, { noremap = true, silent = true, buffer = buffnr, desc = "Implementations" })
    keymap("n", "gT", function()
      telescope.lsp_type_definitions({ reuse_win = true })
    end, { noremap = true, silent = true, buffer = buffnr, desc = "Type Definitions" })
    keymap(
      "n",
      "gD",
      vim.lsp.buf.declaration,
      { noremap = true, silent = true, buffer = buffnr, desc = "Declarations" }
    )
    keymap("n", "<leader>cr", vim.lsp.buf.rename, { noremap = true, silent = true, buffer = buffnr, desc = "Rename" })
    keymap(
      "n",
      "<leader>ca",
      vim.lsp.buf.code_action,
      { noremap = true, silent = true, buffer = buffnr, desc = "Code Actions" }
    )
    keymap("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true, buffer = buffnr })
    keymap("n", "<C-k>", vim.lsp.buf.signature_help, { noremap = true, silent = true, buffer = buffnr })
  end

  lspconfig["lua_ls"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "lua" },
    settings = {
      Lua = {
        diagnostics = { globals = { "vim" } },
        workspace = {
          library = { [vim.fn.expand("$VIMRUNTIME/lua")] = true, [vim.fn.stdpath("config") .. "/lua"] = true },
        },
      },
    },
  })

  lspconfig["gopls"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    settings = {
      gopls = {
        analyses = {
          fieldalignment = true,
          shadow = true,
          unusedparams = true,
          unusedvariable = true,
        },
        completeUnimported = true,
        directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
        hints = {
          assignVariableTypes = true,
          compositeLiteralFields = true,
          compositeLiteralTypes = true,
          constantValues = true,
          functionTypeParameters = true,
          parameterNames = true,
          rangeVariableTypes = true,
        },
        semanticTokens = true,
        staticcheck = true,
        usePlaceholders = false,
      },
    },
  })

  lspconfig["jsonls"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      json = {
        schemas = require("schemastore").json.schemas(),
        validate = { enable = true },
      },
    },
  })

  lspconfig["yamlls"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      yaml = {
        schemaStore = {
          enable = false,
          url = "",
        },
        schemas = require("schemastore").yaml.schemas(),
        validate = { enable = true },
      },
    },
  })

  local servers = {
    "tsserver",
    "pyright",
  }

  local opts = {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  for _, server in pairs(servers) do
    lspconfig[server].setup(opts)
  end
end

return {
  "neovim/nvim-lspconfig",
  config = config,
  lazy = false,
}
