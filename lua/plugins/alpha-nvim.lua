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
      dashboard.button("r", "󱦟  Recent", ":FzfLua oldfiles<CR>"),
      dashboard.button("f", "󰈞  Find file", ":FzfLua files<CR>"),
      dashboard.button("s", "  Side bar", ":Neotree toggle<CR>"),
      dashboard.button("q", "󰿅  Quit", ":qa<CR>"),
    }
    -- dashboard.section.header.val = require('configs.alpha-nvim')['random']
    dashboard.section.header.val = require("configs.alpha-nvim")["pacman"]
    alpha.setup(dashboard.opts)
  end,
}
