local config = function()
  local lint = require("lint")
  local servers = {
    javascript = { "eslint_d" },
    typescript = { "eslint_d" },
    javascriptreact = { "eslint_d" },
    typescriptreact = { "eslint_d" },
    python = { "flake8" },
  }

  lint.linters_by_ft = servers

  local group = vim.api.nvim_create_augroup("nvim-lint", { clear = true })

  -- TODO: Add linting while typing
  vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
    group = group,
    callback = function()
      lint.try_lint()
    end,
  })
end

return {
  "mfussenegger/nvim-lint",
  lazy = false,
  config = config,
}
