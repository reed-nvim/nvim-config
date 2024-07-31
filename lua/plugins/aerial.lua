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
      layout = {
        default_direction = 'right',
        placement = 'window',
      },
      open_automatic = true,
      highlight_on_hover = false,
      ignore = {
        filetypes = { 'neo-tree', 'aerial' },
      },
      close_automatic_events = { 'unsupported', 'switch_buffer', 'unfocus' },
      -- attach_mode = 'window',
      attach_mode = 'global',
      lsp = {
        -- If true, fetch document symbols when LSP diagnostics update.
        diagnostics_trigger_update = true,
      },
      -- optionally use on_attach to set keymaps when aerial has attached to a buffer
      on_attach = function(bufnr)
        -- Jump forwards/backwards with '[s' and ']s'
        vim.keymap.set('n', '[s', '<cmd>AerialPrev<cr>', { buffer = bufnr })
        vim.keymap.set('n', '<leader>s', '<cmd>AerialToggle right<cr>')
        vim.keymap.set('n', ']s', '<cmd>AerialNext<cr>', { buffer = bufnr })
      end,
    }

    -- Function to print the number of symbols in the current buffer
    local function close_if_no_symbols_available()
      local current_buf = vim.api.nvim_get_current_buf()

      -- Get the number of symbols for the current buffer
      local num_symbols = aerial.num_symbols(current_buf)

      -- Print the number of symbols
      -- print('Number of symbols in current buffer: ' .. num_symbols)
      if num_symbols == 0 then
        vim.cmd 'AerialClose'
      end
    end

    -- Auto command to run the function when entering a buffer
    vim.api.nvim_create_autocmd('BufEnter', {
      callback = close_if_no_symbols_available,
    })

    -- Auto command to run the function when opening a buffer
    vim.api.nvim_create_autocmd('BufWinEnter', {
      callback = close_if_no_symbols_available,
    })
  end,
  lazy = false,
  event = 'VeryLazy',
}
