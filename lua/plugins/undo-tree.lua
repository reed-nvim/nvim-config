return {
  "mbbill/undotree",
  config = function()
    vim.keymap.set({ "n", "v" }, "<leader>u", ":UndotreeToggle<cr>", { desc = "Toggle Undotree" })
  end,
}
