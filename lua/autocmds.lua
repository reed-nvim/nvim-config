-- [[ NOTE: Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

local aerial = require "aerial"

local function close_aerial_if_insufficient_num_of_symbols_available()
  local current_buf = vim.api.nvim_get_current_buf()
  local num_symbols = aerial.num_symbols(current_buf)
  if aerial.is_open() and num_symbols < 4 then
    vim.cmd "AerialClose"
  end
end

-- Auto command to run the function when entering a buffer
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.defer_fn(function()
      close_aerial_if_insufficient_num_of_symbols_available()
    end, 50)
  end,
})

-- Auto command to run the function when opening a buffer
vim.api.nvim_create_autocmd("BufWinEnter", {
  callback = function()
    vim.defer_fn(function()
      close_aerial_if_insufficient_num_of_symbols_available()
    end, 50)
  end,
})
