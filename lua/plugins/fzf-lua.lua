-- Define custom highlights using Catppuccin colors
local custom_highlights = function()
  vim.api.nvim_set_hl(0, "FzfLuaBorder", { fg = "#2E3440", bg = "#2E3440" })
  vim.api.nvim_set_hl(0, "FzfLuaPromptBorder", { fg = "#2E3440", bg = "#2E3440" })
  vim.api.nvim_set_hl(0, "FzfLuaResultsBorder", { fg = "#2E3440", bg = "#2E3440" })
  vim.api.nvim_set_hl(0, "FzfLuaPreviewBorder", { fg = "#2E3440", bg = "#2E3440" })
  vim.api.nvim_set_hl(0, "FzfLuaPromptNormal", { fg = "#D8DEE9", bg = "#3B4252" })
  vim.api.nvim_set_hl(0, "FzfLuaPromptPrefix", { fg = "#88C0D0", bg = "#3B4252" })
  vim.api.nvim_set_hl(0, "FzfLuaNormal", { fg = "#ECEFF4", bg = "#2E3440" })
  vim.api.nvim_set_hl(0, "FzfLuaPreviewTitle", { fg = "#D8DEE9", bg = "#3B4252" })
  vim.api.nvim_set_hl(0, "FzfLuaPromptTitle", { fg = "#D8DEE9", bg = "#3B4252" })
  vim.api.nvim_set_hl(0, "FzfLuaResultsTitle", { fg = "#D8DEE9", bg = "#3B4252" })
  vim.api.nvim_set_hl(0, "FzfLuaSelection", { fg = "#ECEFF4", bg = "#4C566A" })
  vim.api.nvim_set_hl(0, "FzfLuaMatching", { fg = "#88C0D0" })
end

return {
  {
    "ibhagwan/fzf-lua",
    event = "VimEnter",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("fzf-lua").setup {
        winopts = {
          border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
          title = "FINDER",
          title_pos = "center",
          preview = {
            default = "bat",
            layout = "horizontal",
            horizontal = "right:60%",
            flip_columns = 120,
            winopts = {
              relativenumber = true,
            },
          },
          hl = {
            normal = "FzfLuaNormal",
            border = "FzfLuaBorder",
            cursor = "FzfLuaCursor",
            cursorline = "FzfLuaCursorLine",
            cursorlinenr = "FzfLuaCursorLineNr",
            search = "FzfLuaSearch",
            title = "FzfLuaTitle",
            preview_border = "FzfLuaPreviewBorder",
            prompt_border = "FzfLuaPromptBorder",
            results_border = "FzfLuaResultsBorder",
            preview_normal = "FzfLuaPreview",
            prompt_normal = "FzfLuaPromptNormal",
            prompt_prefix = "FzfLuaPromptPrefix",
            results_normal = "FzfLuaNormal",
            selection = "FzfLuaSelection",
            matching = "FzfLuaMatching",
          },
        },
        fzf_opts = {
          ["--ansi"] = "",
          ["--prompt"] = "   ", -- Custom prompt
          ["--info"] = "hidden", -- Hide the number of matches
          ["--height"] = "100%",
          ["--layout"] = "reverse",
        },
        fzf_colors = true,
        previewers = {
          bat = {
            cmd = "bat",
            args = "--style=numbers,changes --color always",
          },
          head = {
            cmd = "head",
            args = nil,
          },
          git_diff = {
            cmd = "git diff",
            args = nil,
          },
          builtin = {
            delay = 100,
          },
        },
        files = {
          prompt = "   Files ❯ ", -- Custom prompt for file search
          cwd_prompt = false, -- Disable CWD prompt
        },
        git = {
          status = {
            prompt = "   GitStatus ❯ ",
            file_icons = true,
            color_icons = true,
          },
        },
        grep = {
          prompt = "   Grep ❯ ",
          cmd = "rg --vimgrep --smart-case",
          input_prompt = "Grep For ❯ ",
        },
        buffers = {
          prompt = "   Buffers ❯ ",
          file_icons = true,
          color_icons = true,
        },
        oldfiles = {
          prompt = "   History ❯ ",
          cwd_only = true,
        },
        diagnostics = {
          prompt = "   Diagnostics ❯ ",
          cwd_only = false,
          file_icons = true,
          git_icons = false,
          diag_icons = true,
          diag_source = true,
          icon_padding = "",
          multiline = true,
        },
      }

      -- Set up autocommand to reapply custom highlights after colorscheme changes
      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = custom_highlights,
      })

      -- Key mappings
      local fzf_lua = require "fzf-lua"

      vim.keymap.set("n", "<leader>ff", function()
        fzf_lua.files()
      end, { desc = "Find Files" })

      vim.keymap.set("n", "<leader>fw", function()
        fzf_lua.live_grep()
      end, { desc = "Search Text in Files (Live Grep)" })

      vim.keymap.set("n", "<leader>fg", function()
        fzf_lua.git_status()
      end, { desc = "Git Status" })

      vim.keymap.set("n", "<leader>th", function()
        fzf_lua.colorschemes()
      end, { desc = "Change Colorscheme" })

      vim.keymap.set("n", "<leader>fb", function()
        fzf_lua.buffers()
      end, { desc = "List Open Buffers" })

      vim.keymap.set("n", "<leader>fo", function()
        fzf_lua.oldfiles()
      end, { desc = "Open Recent Files" })

      vim.keymap.set("n", "<leader>fe", function()
        fzf_lua.diagnostics_workspace()
      end, { desc = "Search Workspace Diagnostics" })

      vim.keymap.set("n", "<leader><leader>", function()
        fzf_lua.resume()
      end, { desc = "Resume Last Fzf-Lua Picker" })

      vim.keymap.set({ "n", "x" }, "<leader>vm", ":FzfLua marks<cr>", { desc = "View all marks", silent = true })
      vim.keymap.set({ "n", "x" }, "<leader>dm", ":delmarks!<cr>", { desc = "Delete all marks", silent = true })

      vim.keymap.set("n", "<leader>fn", function()
        fzf_lua.files { cwd = vim.fn.stdpath "config" }
      end, { desc = "Find Neovim Config Files" })

      -- Apply the custom highlights
      custom_highlights()
    end,
  },
}
