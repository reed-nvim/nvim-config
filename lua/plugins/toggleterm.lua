return {
  'akinsho/toggleterm.nvim', -- for versatile terminal integration (a better terminal in neovim)
  version = '*',
  lazy = false,
  config = function()
    require('toggleterm').setup {
      -- Configuration here, or leave empty to use defaults
      -- open_mapping = [[<leader>t]],
      start_in_insert = true,
      direction = 'float',
      float_opts = {
        border = 'curved',
        winblend = 7,
      },
    }
  end,
}
