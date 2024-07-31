return {
  "kdheepak/lazygit.nvim",
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  lazy = false,
  config = function()
    -- Apply custom floating window highlights to match your color scheme
    vim.cmd [[
      highlight FloatBorder guifg=#2E3440 guibg=#2E3440
      highlight NormalFloat guibg=#2E3440
      highlight Normal guifg=#ECEFF4 guibg=#2E3440
    ]]

    -- Optionally, you can set up key mappings here if not using the 'keys' option
    vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "Open LazyGit" })
  end,
}
