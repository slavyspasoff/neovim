local config = function()
  local lspconfig = require("lspconfig")
  local cmp_nvim_lsp = require("cmp_nvim_lsp")

  local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }

  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end

  local capabilities = cmp_nvim_lsp.default_capabilities()

  local on_attach = function(_, buffnr)
    local keymap = vim.keymap.set
    local telescope = require("telescope.builtin")

    keymap("n", "gr", function()
      telescope.lsp_references()
    end, { noremap = true, silent = true, buffer = buffnr, desc = "Reference" })
    keymap("n", "gd", function()
      telescope.lsp_definitions({ reuse_win = true })
    end, { noremap = true, silent = true, buffer = buffnr, desc = "Definitions" })
    keymap("n", "gi", function()
      telescope.lsp_implementations({ reuse_win = true })
    end, { noremap = true, silent = true, buffer = buffnr, desc = "Implementations" })
    keymap("n", "gt", function()
      telescope.lsp_type_definitions({ reuse_win = true })
    end, { noremap = true, silent = true, buffer = buffnr, desc = "Type Definitions" })
    keymap(
      "n",
      "gv",
      vim.lsp.buf.declaration,
      { noremap = true, silent = true, buffer = buffnr, desc = "Declarations" }
    )
    keymap(
      "n",
      "ca",
      vim.lsp.buf.code_action,
      { noremap = true, silent = true, buffer = buffnr, desc = "Code Actions" }
    )
    keymap("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true, buffer = buffnr })
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
        completeUnimported = true,
        usePlaceholders = false,
        analyses = {
          unusedparams = true,
          fieldalignment = true,
          shadow = true,
          unusedvariable = true,
        },
      },
    },
  })
  local servers = {
    "tsserver",
    "jdtls",
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
