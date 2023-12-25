local config = function()
  local ensure_installed = {
    "bash",
    "c",
    "dockerfile",
    "go",
    "gomod",
    "gosum",
    "gowork",
    "graphql",
    "groovy",
    "java",
    "javascript",
    "json",
    "jsdoc",
    "jsonc",
    "lua",
    "python",
    "query",
    "regex",
    "sql",
    "templ",
    "terraform",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "vimdoc",
    "yaml",
  }

  require("nvim-treesitter.configs").setup({
    ensure_installed = ensure_installed,
    sync_install = false,
    auto_install = true,
    ignore_install = {},
    highlight = {
      enable = true,
      disable = {},
      additional_vim_regex_highlighting = false,
    },
    indent = { enable = true },
    autotag = {
      enable = true,
    },
  })
end

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  name = "treesitter",
  lazy = false,
  config = config,
}
