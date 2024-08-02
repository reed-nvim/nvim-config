return {
  "rcarriga/nvim-notify",
  config = function()
    require("notify").setup {
      -- Configuration options
      stages = "fade",
      timeout = 3000,
      background_colour = "Normal",
      -- Add other options here
    }
    vim.notify = require "notify"
  end,
}
