return {
  "ecthelionvi/NeoColumn.nvim",
  event = "BufEnter",
  config = function()
    require("NeoColumn").setup()
    -- require("NeoColumn").toggle_neocolumn()
    vim.keymap.set("n", "<leader>h", "<cmd>ToggleNeoColumn<cr>", { noremap = true, silent = true })
  end,
}
