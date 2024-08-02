return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup {
      options = {
        theme = "dracula",
        -- theme = "horizon",
        -- theme = "iceberg_dark",
        -- theme = "material",
        -- theme = "molokai",
        -- theme = "nightfly",
        -- theme = "palenight",
        -- theme = "ayu_dark",
        -- theme = "ayu_mirage",
        -- theme = "moonfly",
        -- theme = "wombat",
        component_separators = "",
        disabled_filetypes = {
          statusline = { "neo-tree" },
          winbar = { "neo-tree" },
        },
      },
    }
  end,
}
