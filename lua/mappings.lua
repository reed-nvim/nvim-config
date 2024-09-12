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

vim.keymap.set({ "n", "x" }, ",", "<c-^>", { desc = "previous buffer" })
vim.keymap.set({ "n", "x" }, "<leader>\\", ":vsp<cr>", { desc = "open vertical split" }) -- normal mode toggling of char case
vim.keymap.set({ "n", "x" }, "<leader>/", ":normal gcc<cr>", { desc = "toggle comment" }) -- normal mode toggling of char case

-- Opening Neotree
-- vim.keymap.set("n", "<leader>el", ":Neotree toggle left<cr>", { desc = "open Neotree on the left" })
-- vim.keymap.set("n", "<leader>eb", ":Neotree toggle bottom<cr>", { desc = "open Neotree from the bottom of the screen" })
vim.keymap.set("n", "<leader>ef", ":Neotree toggle float<cr>", { desc = "open Neotree in float position" })
vim.keymap.set("n", "<leader>er", ":Neotree reveal float<cr>", { desc = "reveal current File in Neotree" })
-- vim.keymap.set("n", "<leader>eg", ":Neotree float git_status<cr>", { desc = "open git_status in floating Neotree" })

-- Opening LazyGit
vim.keymap.set("n", "<leader>lg", ":LazyGit<cr>", { desc = "LazyGit" })

-- for tmux navigation
vim.keymap.set({ "n", "x" }, "<c-h>", ":TmuxNavigateLeft<cr>")
vim.keymap.set({ "n", "x" }, "<c-j>", ":TmuxNavigateDown<cr>")
vim.keymap.set({ "n", "x" }, "<c-k>", ":TmuxNavigateUp<cr>")
vim.keymap.set({ "n", "x" }, "<c-l>", ":TmuxNavigateRight<cr>")
vim.keymap.set({ "n", "x" }, "<c-\\>", ":TmuxNavigatePrevious<cr>")

-- Keybindings for bufferline
vim.api.nvim_set_keymap("n", "<Tab>", ":BufferLineCycleNext<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-Tab>", ":BufferLineCyclePrev<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>xo", ":BufferLineCloseOthers<cr>", { noremap = true, silent = true, desc = "close all other visible buffers" })
vim.api.nvim_set_keymap("n", "<leader>w", ":Bdelete<cr>", { noremap = true, silent = true, desc = "close current buffer" })
vim.api.nvim_set_keymap(
  "n",
  "<leader>xr",
  ":BufferLineCloseRight<cr>",
  { noremap = true, silent = true, desc = "close all visible buffers to the right of the current buffer" }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>xl",
  ":BufferLineCloseLeft<cr>",
  { noremap = true, silent = true, desc = "close all visible buffers to the left of the current buffer" }
)

-- shortcuts
-- '<c-w> =' :  make splits equal (native keybinding)
