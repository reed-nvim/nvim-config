return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "nvim-lua/plenary.nvim",
  },
  lazy = false,
  config = function()
    local alpha = require "alpha"
    local dashboard = require "alpha.themes.dashboard"
    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button("f", "  Find File", ":lua Snacks.dashboard.pick('files')"),
      dashboard.button("n", "  New File", ":ene | startinsert"),
      dashboard.button("g", "  Find Text", ":lua Snacks.dashboard.pick('live_grep')"),
      dashboard.button("r", "  Recent Files", ":lua Snacks.dashboard.pick('oldfiles')"),
      dashboard.button("c", "  Config", ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})"),
      dashboard.button("L", "󰒲  Lazy", ":Lazy<CR>"),
      dashboard.button("q", "  Quit", ":qa<CR>"),
    }
    dashboard.section.header.val = require("configs.alpha-nvim")["pacman"]
    alpha.setup(dashboard.opts)
  end,
}
