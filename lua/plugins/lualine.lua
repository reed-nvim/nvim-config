return {
  "nvim-lualine/lualine.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup {
      options = {
        theme = "dracula",
        -- theme = "horizon",
        -- theme = "iceberg_dark",
        -- theme = "material",
        -- theme = "ayu_dark",
        -- theme = "ayu_mirage",
        -- theme = "wombat",
        component_separators = "",
        disabled_filetypes = {
          statusline = {
            "neo-tree",
            "aerial",
            "DiffviewFiles",
            "DiffviewFiles",
            "DiffviewFileHistory",
          },
          winbar = { "neo-tree" },
        },
      },
    }
  end,
}
