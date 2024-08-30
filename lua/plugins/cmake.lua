return {
  "Civitasv/cmake-tools.nvim",
  config = function()
    require("cmake-tools").setup {
      cmake_command = "cmake",
      cmake_build_directory = "build",
      cmake_generate_options = { "-D", "CMAKE_EXPORT_COMPILE_COMMANDS=1" },
      cmake_build_options = {},
      cmake_console_size = 10,
      cmake_console_position = "belowright", -- This line is added
      cmake_show_console = "always",
      cmake_dap_configuration = { name = "cpp", type = "codelldb", request = "launch" },
      cmake_dap_open_command = require("dap").repl.open,
    }
  end,
}
