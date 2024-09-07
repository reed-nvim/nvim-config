return {
  "vinnymeller/swagger-preview.nvim",
  config = function()
    require("swagger-preview").setup {}
    -- require "swagger-preview.init"
    vim.keymap.set("n", "<leader>sw", ":SwaggerPreviewToggle<cr>", { desc = "[S][W]agger" })
  end,
}
