-- [[NOTE: Basic Keymaps ]]
--  See `:help vim.keymap.set()`
--  clear highlighted search on pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", ":nohlsearch<cr>")
-- Quick move back to insert mode
vim.keymap.set("i", "jk", "<Esc>")

-- Remapping number increment and decrement key bindings
vim.keymap.set({ "n", "x" }, "<leader>=", "<c-a>", { desc = "increment number" }) -- remapping the incr and decr key maps to something more intuitive
vim.keymap.set({ "n", "x" }, "<leader>-", "<c-x>", { desc = "decrement number" }) -- remapping the incr and decr key maps to something more intuitive

-- Remapping semi colon to colon
vim.keymap.set({ "n", "x" }, ";", ":FineCmdline<cr>", { desc = "enter FineCmdline mode", silent = true })
-- vim.keymap.set({ "n", "x" }, ",", "<c-^>", { desc = "previous buffer" })
vim.keymap.set({ "n", "x" }, "<leader>\\", ":vsp<cr>", { desc = "open vertical split" }) -- normal mode toggling of char case
vim.keymap.set({ "n", "x" }, "<leader>/", ":normal gcc<cr>", { desc = "toggle comment" }) -- normal mode toggling of char case

-- for tmux navigation
vim.keymap.set({ "n", "x" }, "<c-h>", ":TmuxNavigateLeft<cr>")
vim.keymap.set({ "n", "x" }, "<c-j>", ":TmuxNavigateDown<cr>")
vim.keymap.set({ "n", "x" }, "<c-k>", ":TmuxNavigateUp<cr>")
vim.keymap.set({ "n", "x" }, "<c-l>", ":TmuxNavigateRight<cr>")
vim.keymap.set({ "n", "x" }, "<c-\\>", ":TmuxNavigatePrevious<cr>")

-- shortcuts
-- '<c-w> =' :  make splits equal (native keybinding)
