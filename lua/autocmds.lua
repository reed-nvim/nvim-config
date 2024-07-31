-- [[ NOTE: Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Function to check if any normal buffers are open
local function close_aerial_if_no_buffers()
  local open_buffers = vim.fn.getbufinfo { buflisted = 1 }
  local normal_buffers = 0
  for _, buf in ipairs(open_buffers) do
    if vim.bo[buf.bufnr].buftype == '' then
      normal_buffers = normal_buffers + 1
    end
  end
  if normal_buffers == 0 then
    vim.cmd 'AerialClose'
  end
end

local function close_aerial_if_focus_is_neotree()
  local current_buf = vim.api.nvim_get_current_buf()
  local buf_filetype = vim.bo[current_buf].filetype

  -- Close Aerial if the focused buffer is Neotree
  if buf_filetype == 'neo-tree' then
    vim.cmd 'AerialClose'
  end
end

-- Function to check if the only remaining buffer is Neotree
local function close_aerial_if_only_neotree()
  local open_buffers = vim.fn.getbufinfo { buflisted = 1 }
  local normal_buffers = 0
  local neotree_buffers = 0

  for _, buf in ipairs(open_buffers) do
    if vim.bo[buf.bufnr].buftype == '' then
      normal_buffers = normal_buffers + 1
    elseif vim.bo[buf.bufnr].filetype == 'neo-tree' then
      neotree_buffers = neotree_buffers + 1
    end
  end

  -- Close Aerial if there are no normal buffers and only Neotree is open
  if normal_buffers == 0 and neotree_buffers > 0 then
    vim.cmd 'AerialClose'
  end

  close_aerial_if_no_buffers()
  close_aerial_if_focus_is_neotree()
end

-- Auto command to run the function when a buffer is closed
vim.api.nvim_create_autocmd('BufDelete', {
  callback = close_aerial_if_only_neotree,
})
