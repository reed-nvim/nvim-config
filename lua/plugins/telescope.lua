-- Define custom highlights using Catppuccin colors
local custom_highlights = function()
  vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "#2E3440", bg = "#2E3440" })
  vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = "#2E3440", bg = "#2E3440" })
  vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = "#2E3440", bg = "#2E3440" })
  vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = "#2E3440", bg = "#2E3440" })
  vim.api.nvim_set_hl(0, "TelescopePromptNormal", { fg = "#D8DEE9", bg = "#3B4252" })
  vim.api.nvim_set_hl(0, "TelescopePromptPrefix", { fg = "#88C0D0", bg = "#3B4252" })
  vim.api.nvim_set_hl(0, "TelescopeNormal", { fg = "#ECEFF4", bg = "#2E3440" })
  vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { fg = "#D8DEE9", bg = "#3B4252" })
  vim.api.nvim_set_hl(0, "TelescopePromptTitle", { fg = "#D8DEE9", bg = "#3B4252" })
  vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { fg = "#D8DEE9", bg = "#3B4252" })
  vim.api.nvim_set_hl(0, "TelescopeSelection", { fg = "#ECEFF4", bg = "#4C566A" })
  vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = "#88C0D0" })
end

return {
  { -- Fuzzy Finder (files, lsp, etc)
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        "nvim-telescope/telescope-fzf-native.nvim",

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = "make",

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable "make" == 1
        end,
      },
      { "nvim-telescope/telescope-ui-select.nvim" },

      -- Useful for getting pretty icons, but requires a Nerd Font.
      { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
    },
    config = function()
      -- Telescope is a fuzzy finder that comes with a lot of different things that
      -- it can fuzzy find! It's more than just a "file finder", it can search
      -- many different aspects of Neovim, your workspace, LSP, and more!
      --
      -- The easiest way to use Telescope, is to start by doing something like:
      --  :Telescope help_tags

      -- [[ PERF: Configure Telescope ]]
      local actions = require "telescope.actions"

      -- See `:help telescope` and `:help telescope.setup()`
      require("telescope").setup {
        defaults = {
          vimgrep_arguments = {
            "rg",
            "-L",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
          },
          initial_mode = "insert",
          selection_strategy = "reset",
          sorting_strategy = "descending",
          layout_strategy = "horizontal",
          -- entry_prefix = '   ',
          entry_prefix = " -  ",
          prompt_prefix = "   ",
          selection_caret = " 👉 ",
          -- Searching
          file_ignore_patterns = {
            ".git/",
            "%.jpg",
            "%.jpeg",
            "%.png",
            "%.webp",
            "%.svg",
            "%.xlsx",
            "%.csv",
            "%.otf",
            "%.ttf",
            "%.lock",
            "__pycache__",
            "%.sqlite3",
            "%.ipynb",
            "vendor",
            "node_modules",
            "dotbot",
            "packer_compiled.lua",
          },
          layout_config = {
            horizontal = {
              prompt_position = "bottom",
              preview_width = 0.55,
              results_width = 0.8,
            },
            vertical = {
              mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
          },
          file_sorter = require("telescope.sorters").get_fuzzy_file,
          generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
          path_display = { "truncate" },
          winblend = 0,
          -- Configure the border
          border = {},
          borderchars = {
            prompt = { "━", "┃", "━", "┃", "┏", "┓", "┛", "┗" },
            results = { "━", "┃", "━", "┃", "┏", "┓", "┛", "┗" },
            preview = { "━", "┃", "━", "┃", "┏", "┓", "┛", "┗" },
          },
          color_devicons = true,
          set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
          file_previewer = require("telescope.previewers").vim_buffer_cat.new,
          grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
          qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
          -- Developer configurations: Not meant for general override
          buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
          mappings = {
            n = { ["q"] = require("telescope.actions").close },
          },
        },
        extensions_list = { "themes", "terms" },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown(),
          },
        },
        pickers = {
          buffers = {
            mappings = {
              i = {
                ["<c-d>"] = actions.delete_buffer + actions.move_to_bottom,
              },
              n = {
                ["<c-d>"] = actions.delete_buffer + actions.move_to_bottom,
              },
            },
          },
        },
      }

      -- Enable Telescope extensions if they are installed
      pcall(require("telescope").load_extension, "fzf")
      pcall(require("telescope").load_extension, "ui-select")

      -- Set up autocommand to reapply custom highlights after colorscheme changes
      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = custom_highlights,
      })

      -- See `:help telescope.builtin`
      -- telescope key binds
      local builtin = require "telescope.builtin"
      -- vim.keymap.set('n', '<leader>th', function()
      -- builtin.colorscheme()
      -- custom_highlights()
      -- end, { desc = 'View available colorschemes/themes' })
      -- vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      -- vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[S]earch [F]iles' })
      -- vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      -- vim.keymap.set('n', '<leader>fw', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      -- vim.keymap.set('n', '<leader>fe', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      -- vim.keymap.set("n", "<leader><leader>", builtin.resume, { desc = "[S]earch [R]esume" })
      -- vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      -- vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[S]earch [H]elp" })
      -- vim.keymap.set({ "n", "x" }, "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "open TODOs in Telescope" })
      -- Slightly advanced example of overriding default behavior and theme
      -- vim.keymap.set('n', '<leader>fb', function()
      -- You can pass additional configuration to Telescope to change the theme, layout, etc.
      -- builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
      -- winblend = 10,
      -- previewer = false,
      -- })
      -- end, { desc = '[/] Fuzzily search in current buffer' })
      -- Shortcut for searching your Neovim configuration files
      -- vim.keymap.set("n", "<leader>sn", function()
      -- builtin.find_files { cwd = vim.fn.stdpath "config" }
      -- end, { desc = "[S]earch [N]eovim files" })

      -- Apply the custom highlights
      custom_highlights()
    end,
  },

  {
    "nvim-telescope/telescope-ui-select.nvim", --allows code-actions to be viewed in telescope
    config = function()
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {},
          },
        },
      }
      require("telescope").load_extension "ui-select"
    end,
  },
}
