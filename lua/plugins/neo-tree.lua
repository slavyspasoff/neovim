local config = function()
  require("neo-tree").setup({
    close_if_last_window = true,
    enable_diagnostics = false,
    open_files_do_not_replace_types = { "Trouble", "trouble", "qf" },
    filesystem = {
      filtered_items = {
        hide_dotfiles = true,
        hide_gitignored = true,
        hide_by_name = {
          "node_modules",
        },
        always_show = {
          ".env",
        },
      },
      follow_current_file = {
        enabled = true,
      },
      group_empty_dirs = false,
      hijack_netrw_behavior = "open_default",
      use_libuv_file_watcher = true,
      window = {
        mappings = {
          ["<bs>"] = "navigate_up",
          ["."] = "set_root",
          ["H"] = "toggle_hidden",
          ["/"] = "fuzzy_finder",
          ["D"] = "nope",
          ["#"] = "nope", -- fuzzy sorting using the fzy algorithm
          -- ["D"] = "fuzzy_sorter_directory",
          ["f"] = "nope",
          ["<c-x>"] = "clear_filter",
          ["[g"] = "nope",
          ["]g"] = "nope",
          ["o"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "o" } },
          ["oc"] = "nope",
          ["od"] = "nope",
          ["og"] = "nope",
          ["om"] = "nope",
          ["on"] = "nope",
          ["os"] = "nope",
          ["ot"] = "nope",
        },
        fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
          ["<down>"] = "move_cursor_down",
          ["<C-j>"] = "move_cursor_down",
          ["<up>"] = "move_cursor_up",
          ["<C-k>"] = "move_cursor_up",
        },
      },
    },
    window = {
      position = "right",
      width = 35,
      mapping_options = {
        noremap = true,
        nowait = true,
      },
      mappings = {
        ["<space>"] = "nope",
        ["<2-LeftMouse>"] = "nope",
        ["<cr>"] = "open",
        ["<esc>"] = "cancel",
        ["P"] = "nope",
        ["l"] = "nope",
        ["S"] = "nope",
        ["s"] = "nope",
        ["t"] = "nope",
        ["w"] = "nope",
        ["C"] = "nope",
        ["z"] = "close_node",
        ["a"] = {
          "add",
          -- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
          -- some commands may take optional config options, see `:h neo-tree-mappings` for details
          config = {
            show_path = "none", -- "none", "relative", "absolute"
          },
        },
        ["A"] = "nope", -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
        ["d"] = "nope",
        ["r"] = "nope",
        ["y"] = "nope",
        ["x"] = "nope",
        ["p"] = "nope",
        ["c"] = "nope", -- takes text input for destination, also accepts the optional config.show_path option like "add":
        ["m"] = "nope", -- takes text input for destination, also accepts the optional config.show_path option like "add".
        ["q"] = "close_window",
        ["R"] = "refresh",
        ["?"] = "show_help",
        ["<"] = "prev_source",
        [">"] = "next_source",
        ["i"] = "nope",
      },
    },
    default_component_configs = {
      icon = {
        folder_closed = "",
        folder_open = "",
        folder_empty = "󰜌",
        default = "*",
        highlight = "NeoTreeFileIcon",
      },
      modified = {
        symbol = "[+]",
        highlight = "NeoTreeModified",
      },
      name = {
        trailing_slash = false,
        use_git_status_colors = true,
        highlight = "NeoTreeFileName",
      },
      git_status = {
        symbols = {
          -- Change type
          added = "✚", -- or "✚", but this is redundant info if you use git_status_colors on the name
          modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
          deleted = "✖", -- this can only be used in the git_status source
          renamed = "󰁕", -- this can only be used in the git_status source
          -- Status type
          untracked = "",
          ignored = "",
          unstaged = "󰄱",
          staged = "",
          conflict = "",
        },
      },
    },
    buffers = {
      follow_current_file = {
        enabled = true, -- This will find and focus the file in the active buffer every time
        --              -- the current file is changed while the tree is open.
        leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
      },
      group_empty_dirs = true, -- when true, empty folders will be grouped together
      show_unloaded = true,
      window = {
        mappings = {
          ["bd"] = "nope",
          ["<bs>"] = "nope",
          ["."] = "nope",
          ["o"] = "nope",
          ["oc"] = "nope",
          ["od"] = "nope",
          ["om"] = "nope",
          ["on"] = "nope",
          ["os"] = "nope",
          ["ot"] = "nope",
        },
      },
    },
    git_status = {
      window = {
        position = "float",
        mappings = {
          ["A"] = "nope",
          ["gu"] = "nope",
          ["ga"] = "nope",
          ["gr"] = "nope",
          ["gc"] = "nope",
          ["gp"] = "nope",
          ["gg"] = "nope",
          ["o"] = "nope",
          ["oc"] = "nope",
          ["od"] = "nope",
          ["om"] = "nope",
          ["on"] = "nope",
          ["os"] = "nope",
          ["ot"] = "nope",
        },
      },
    },
  })
end

local keys = {
  {
    "<leader>ee",
    function()
      require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
    end,
    desc = "Files",
  },
  {
    "<leader>eb",
    function()
      require("neo-tree.command").execute({ toggle = true, source = "buffers" })
    end,
    desc = "Buffers",
  },
  {
    "<leader>eg",
    function()
      require("neo-tree.command").execute({ toggle = true, source = "git_status" })
    end,
    desc = "Git",
  },
}

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  lazy = false,
  config = config,
  keys = keys,
}
