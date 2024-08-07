-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  cmd = "Neotree",
  lazy = false,
  opts = {
    close_if_last_window = true,
    filter_rules = {
      include_current_win = false,
      -- filter using buffer options
      bo = {
        -- if the file type is one of following, the window will be ignored
        filetype = { "neo-tree", "neo-tree-popup", "notify" },
        -- if the buffer type is one of following, the window will be ignored
        buftype = { "terminal", "quickfix" },
      },
    },
    {
      window = {
        mappings = {
          ["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = true } },
        },
      },
    },
    default_component_configs = {
      indent = {
        indent_size = 2,
        padding = 1, -- extra padding on left hand side
        -- indent guides
        with_markers = true,
        indent_marker = "│",
        last_indent_marker = "└",
        highlight = "NeoTreeIndentMarker",
        -- expander config, needed for nesting files
        with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
        expander_collapsed = "",
        expander_expanded = "",
        expander_highlight = "NeoTreeExpander",
      },
      icon = {
        default = "*",
        highlight = "NeoTreeFileIcon",
      },
      modified = {
        symbol = "👀  ",
        highlight = "NeoTreeModified",
      },
      git_status = {
        symbols = {
          -- Change type
          modified = "󰩔  ",
          -- Status type
          conflict = "🔥 ",
          untracked = "  ",
          -- Change type
          added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
          -- modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
          deleted = "  ", -- this can only be used in the git_status source
          renamed = "󰁕  ", -- this can only be used in the git_status source
          -- Status type
          -- untra cked = "",
          -- conflict  = "",
          ignored = "  ",
          unstaged = "",
          staged = "",
        },
      },
    },
    filesystem = {
      filtered_items = {
        visible = true, -- This will show the filtered items
        hide_dotfiles = false,
        hide_gitignored = false,
        never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
          ".DS_Store",
          -- '.git/*',
          ".git",
          ".aws-sam",
          ".vscode",
        },
      },
      follow_current_file = {
        enabled = true, -- This will find and focus the file in the active buffer every time
        --               -- the current file is changed while the tree is open.
        leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
      },
    },
  },
} -- for filetree simulation
