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
          ["D"] = "none",
          ["#"] = "none",
          ["f"] = "none",
          ["<c-x>"] = "clear_filter",
          ["[g"] = "none",
          ["]g"] = "none",
          ["o"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "o" } },
          ["oc"] = "none",
          ["od"] = "none",
          ["og"] = "none",
          ["om"] = "none",
          ["on"] = "none",
          ["os"] = "none",
          ["ot"] = "none",
        },
        fuzzy_finder_mappings = {
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
        ["<space>"] = "none",
        ["<2-LeftMouse>"] = "none",
        ["<cr>"] = "open",
        ["<esc>"] = "cancel",
        ["P"] = "none",
        ["l"] = "none",
        ["S"] = "none",
        ["s"] = "none",
        ["t"] = "none",
        ["w"] = "none",
        ["C"] = "none",
        ["z"] = "close_node",
        ["a"] = "none",
        ["A"] = "none",
        ["d"] = "none",
        ["r"] = "none",
        ["y"] = "none",
        ["x"] = "none",
        ["p"] = "none",
        ["c"] = "none",
        ["m"] = "none",
        ["q"] = "close_window",
        ["R"] = "refresh",
        ["?"] = "show_help",
        ["<"] = "prev_source",
        [">"] = "next_source",
        ["i"] = "none",
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
          added = "✚",
          modified = "",
          deleted = "✖",
          renamed = "󰁕",
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
        enabled = true,
        leave_dirs_open = false,
      },
      group_empty_dirs = true,
      show_unloaded = true,
      window = {
        mappings = {
          ["bd"] = "none",
          ["<bs>"] = "none",
          ["."] = "none",
          ["o"] = "none",
          ["oc"] = "none",
          ["od"] = "none",
          ["om"] = "none",
          ["on"] = "none",
          ["os"] = "none",
          ["ot"] = "none",
        },
      },
    },
    git_status = {
      window = {
        position = "float",
        mappings = {
          ["A"] = "none",
          ["gu"] = "none",
          ["ga"] = "none",
          ["gr"] = "none",
          ["gc"] = "none",
          ["gp"] = "none",
          ["gg"] = "none",
          ["o"] = "none",
          ["oc"] = "none",
          ["od"] = "none",
          ["om"] = "none",
          ["on"] = "none",
          ["os"] = "none",
          ["ot"] = "none",
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
