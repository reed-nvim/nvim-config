return {
  'stevearc/aerial.nvim',
  -- Optional dependencies
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    local aerial = require 'aerial'
    aerial.setup {
      default_direction = 'prefer_right',
      open_automatic = true,
      -- optionally use on_attach to set keymaps when aerial has attached to a buffer
      on_attach = function(bufnr)
        -- Jump forwards/backwards with '[s' and ']s'
        vim.keymap.set('n', '[s', '<cmd>AerialPrev<cr>', { buffer = bufnr })
        vim.keymap.set('n', '<leader>s', '<cmd>AerialToggle right<cr>')
        vim.keymap.set('n', ']s', '<cmd>AerialNext<cr>', { buffer = bufnr })
        if aerial.num_symbols(bufnr) < 4 then
          vim.cmd 'AerialClose'
        end
      end,
    }
  end,
  lazy = false,
  event = 'VeryLazy',
}
