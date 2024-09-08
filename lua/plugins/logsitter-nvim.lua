return {
  "gaelph/logsitter.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("logsitter").setup {
      path_format = "fileonly",
      prefix = "[🚀] ",
      separator = "=>",
    }
    vim.keymap.set("n", "<leader>ls", ":Logsitter<cr>", { desc = "LazyGit" })
  end,
}
