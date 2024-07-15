-- [[NOTE: Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Quick move back to insert mode
vim.keymap.set('i', 'jk', '<Esc>')
-- Remapping semi colon to colon
vim.keymap.set({ 'n', 'x' }, '', '<c-^>', { desc = 'previous buffer' })
vim.keymap.set({ 'n', 'x' }, ';', '<cmd>FineCmdline<cr>', { desc = 'enter FineCmdline mode', silent = true })
-- vim.keymap.set({ 'n', 'x' }, ':', '<cmd>FineCmdline<cr>', { noremap = true, desc = 'enter FineCmdline mode', silent = true })
vim.keymap.set({ 'n', 'x' }, '<leader>c', '<cmd>normal ~<cr>', { desc = 'toggle case' }) -- normal mode toggling of char case
vim.keymap.set({ 'n', 'x' }, '<leader>\\', '<cmd>vsp<cr>', { desc = 'open vertical split' }) -- normal mode toggling of char case
vim.keymap.set({ 'n', 'x' }, '<leader>/', '<cmd>normal gcc<cr>', { desc = 'toggle comment' }) -- normal mode toggling of char case
vim.keymap.set('n', '<leader>fe', '<cmd>Neotree toggle<cr>', { desc = 'open Neotree' })
vim.keymap.set('n', '<c-g>', '<cmd>Neotree float git_status<cr>', { desc = 'open git_status on floaring Neotree' })
vim.keymap.set({ 'n', 'x' }, '<leader>ft', '<cmd>TodoTelescope<cr>', { desc = 'open TODOs in Telescope' })
vim.keymap.set('n', '<leader>th', '<cmd>Telescope colorscheme<cr>', { desc = 'view available colorschemes/themes' })
vim.keymap.set('n', '<leader>lg', '<cmd>LazyGit<cr>', { desc = 'LazyGit' })

-- Diagnostic keymaps
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
