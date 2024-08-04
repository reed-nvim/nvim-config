return {
  "stevearc/aerial.nvim",
  -- Optional dependencies
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local aerial = require "aerial"
    aerial.setup {
      layout = {
        default_direction = "right",
        placement = "window",
      },
      open_automatic = true,
      highlight_on_hover = false,
      ignore = {
        filetypes = { "neo-tree", "aerial", "oil" },
      },
      close_automatic_events = { "unsupported", "switch_buffer", "unfocus" },
      -- attach_mode = 'window',
      attach_mode = "global",
      lsp = {
        -- If true, fetch document symbols when LSP diagnostics update.
        diagnostics_trigger_update = true,
      },
      -- optionally use on_attach to set keymaps when aerial has attached to a buffer
      on_attach = function(bufnr)
        -- Jump forwards/backwards with '[s' and ']s'
        vim.keymap.set("n", "[s", "<cmd>AerialPrev<cr>", { buffer = bufnr })
        vim.keymap.set("n", "<leader>s", "<cmd>AerialToggle right<cr>")
        vim.keymap.set("n", "]s", "<cmd>AerialNext<cr>", { buffer = bufnr })
      end,
    }
  end,
  lazy = false,
  event = "VeryLazy",
}
