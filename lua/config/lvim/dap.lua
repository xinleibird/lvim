lvim.builtin.dap.ui.config.layouts = {
  {
    elements = {
      { id = "scopes", size = 0.23 },
      { id = "breakpoints", size = 0.23 },
      { id = "stacks", size = 0.23 },
      { id = "watches", size = 0.23 },
      { id = "console", size = 0.08 },
    },
    size = 0.25,
    position = "left",
  },
  -- {
  --   elements = {
  --     -- { id = "repl", size = 0.5 },
  --     -- { id = "console", size = 0.5 },
  --   },
  --   size = 0.25,
  --   position = "bottom",
  -- },
}

lvim.builtin.dap.ui.auto_open = false
lvim.builtin.dap.ui.config.controls.enabled = false

local dap = require "dap"

for _, type in ipairs { "pwa-extensionHost", "node-terminal", "pwa-node", "pwa-chrome", "pwa-msedge" } do
  dap.adapters[type] = {
    executable = {
      -- command = "node",
      -- -- 💀 Make sure to update this path to point to your installation
      -- args = { "/path/to/js-debug/src/dapDebugServer.js", "${port}" },
      command = "js-debug-adapter",
      args = { "${port}" },
    },
    host = "localhost",
    port = "${port}",
    type = "server",
  }
end

dap.adapters.firefox = {
  command = "firefox-debug-adapter",
  type = "executable",
}

for _, lans in ipairs { "typescript", "javascript", "typescriptreact", "javascriptreact" } do
  dap.configurations[lans] = {
    {
      name = "Launch Chrome",
      reAttach = true,
      request = "launch",
      type = "pwa-chrome",
      url = "http://localhost:8080",
      webRoot = "${workspaceFolder}",
    },
    {
      firefoxExecutable = "/opt/homebrew/bin/firefox",
      name = "Lanuch Firefox",
      reAttach = true,
      request = "launch",
      type = "firefox",
      url = "http://localhost:8080",
      webRoot = "${workspaceFolder}",
    },
    {
      attachSimplePort = 9229,
      cwd = "${workspaceFolder}",
      name = "Launch with Deno",
      program = "${file}",
      request = "launch",
      type = "pwa-node",
      runtimeArgs = {
        "run",
        "--inspect-wait",
        "--allow-all",
      },
      runtimeExecutable = "deno",
    },
    {
      cwd = "${workspaceFolder}",
      name = "Launch with Node",
      program = "${file}",
      request = "launch",
      type = "pwa-node",
      runtimeArgs = {
        "--inspect-brk",
      },
    },
    {
      cwd = "${workspaceFolder}",
      name = "Attach into Node",
      processId = require("dap.utils").pick_process,
      request = "attach",
      type = "pwa-node",
    },
  }
end
