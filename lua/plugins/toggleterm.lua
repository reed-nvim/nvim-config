return {
  "akinsho/toggleterm.nvim", -- for versatile terminal integration (a better terminal in neovim)
  version = "*",
  lazy = false,
  config = function()
    require("toggleterm").setup {
      -- Configuration here, or leave empty to use defaults
      open_mapping = [[<c-a>]],
      start_in_insert = true,
      direction = "float",
      float_opts = {
        border = "curved",
        winblend = 4,
        highlights = {
          -- Custom highlights to match your theme
          border = "FzfLuaBorder", -- Using the same border color as fzf-lua
          background = "FzfLuaNormal", -- Match the background color with fzf-lua's normal background
        },
      },
      highlights = {
        -- Custom highlights to match the colors used in Telescope and fzf-lua
        FloatBorder = {
          guifg = "#2E3440", -- Border color used in fzf-lua and Telescope
          guibg = "#2E3440", -- Background color for the border, consistent with your theme
        },
        NormalFloat = {
          guifg = "#ECEFF4", -- Foreground color used in fzf-lua
          guibg = "#2E3440", -- Background color consistent with fzf-lua
        },
        -- Additional customization can be added here to match other elements if needed
      },
    }
  end,
}
