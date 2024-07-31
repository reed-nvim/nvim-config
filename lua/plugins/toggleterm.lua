return {
  "akinsho/toggleterm.nvim", -- for versatile terminal integration (a better terminal in neovim)
  version = "*",
  lazy = false,
  config = function()
    require("toggleterm").setup {
      -- Configuration here, or leave empty to use defaults
      -- open_mapping = [[<c-a>]],
      open_mapping = [[<leader><leader>]],
      start_in_insert = true,
      direction = "float",
      float_opts = {
        border = "curved",
        winblend = 4,
      },
      highlights = {
        -- highlights which map to a highlight group name and a table of it's values
        -- NOTE: this is only a subset of values, any group placed here will be set for the terminal window split
        FloatBorder = {
          guifg = "#44475A",
          guibg = "#44475A",
          -- guifg = '#6272a4',
          -- guibg = '#6272a4',
        },
      },
    }
  end,
}
