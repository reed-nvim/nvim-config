-- ~/.config/nvim/lua/dap-config.lua
local dap = require 'dap'
local dapui = require 'dapui'

-- Setup dap-ui
dapui.setup()

-- Configure Go adapter
dap.adapters.go = {
  type = 'server',
  port = '${port}',
  executable = {
    command = 'dlv',
    args = { 'dap', '-l', '127.0.0.1:${port}' },
  },
}

dap.configurations.go = {
  {
    type = 'go',
    name = 'Debug',
    request = 'launch',
    program = '${file}',
  },
  {
    type = 'go',
    name = 'Debug test', -- Configuration for debugging test files
    request = 'launch',
    mode = 'test',
    program = '${file}',
  },
  {
    type = 'go',
    name = 'Debug test (package)', -- Configuration for debugging test package
    request = 'launch',
    mode = 'test',
    program = './${relativeFileDirname}',
  },
}

-- Automatically open dap-ui when starting a debug session
dap.listeners.after.event_initialized['dapui_config'] = function()
  dapui.open()
end

-- Automatically close dap-ui when terminating a debug session
dap.listeners.before.event_terminated['dapui_config'] = function()
  dapui.close()
end
dap.listeners.before.event_exited['dapui_config'] = function()
  dapui.close()
end
