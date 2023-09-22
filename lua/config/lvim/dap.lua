lvim.builtin.dap.ui.config.layouts = {
  {
    elements = {
      { id = "scopes", size = 0.23 },
      { id = "breakpoints", size = 0.23 },
      { id = "stacks", size = 0.23 },
      { id = "watches", size = 0.23 },
      { id = "console", size = 0.08 },
    },
    size = 0.2,
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

-- local js_debug_adapter_path =
--   require("lvim.utils").join_paths(get_runtime_dir(), "mason", "packages", "js-debug-adapter", "js-debug", "src")

-- print(js_debug_adapter_path)

-- require("dap").adapters["pwa-node"] = {
--   type = "server",
--   host = "localhost",
--   port = "${port}",
--   executable = {
--     command = "node",
--     -- 💀 Make sure to update this path to point to your installation
--     args = {
--       "/Users/xinlei/.local/share/nvim/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
--       "${port}",
--     },
--   },
-- }

-- require("dap").configurations.javascript = {
--   {
--     type = "pwa-node",
--     request = "launch",
--     name = "Launch Node",
--     program = "${file}",
--     cwd = "${workspaceFolder}",
--   },
--   {
--     type = "pwa-node",
--     request = "launch",
--     name = "Launch Deno",
--     runtimeExecutable = "deno",
--     runtimeArgs = {
--       "run",
--       "--inspect-wait",
--       "--allow-all",
--     },
--     program = "${file}",
--     cwd = "${workspaceFolder}",
--     attachSimplePort = 9229,
--   },
-- }
