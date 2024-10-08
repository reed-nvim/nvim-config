return {
  "VonHeikemen/fine-cmdline.nvim",
  dependencies = {
    { "MunifTanjim/nui.nvim" },
  },
  opts = {
    cmdline = {
      enable_keymaps = true,
      smart_history = true,
      prompt = "  : ",
    },
    popup = {
      position = {
        row = "10%",
        col = "50%",
      },
      size = {
        width = "50%",
      },
      border = {
        style = "single",
        text = {
          -- top = 'Give it to me',
          top = "󰮯  CMD  󰮯 ",
          top_align = "center",
        },
      },
      win_options = {
        winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
      },
    },
  },
  lazy = false,
}
