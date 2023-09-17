local M = {
  {
    "mxsdev/nvim-dap-vscode-js",
    event = "VeryLazy",
    dependencies = {
      {
        "microsoft/vscode-js-debug",
        module = true,
        build = "npm clean-install --legacy-peer-deps && npx gulp vsDebugServerBundle && rm -rf out && mv dist out",
      },
    },
    config = function()
      local dap = require "dap"
      local dap_vscode_js = require "dap-vscode-js"
      -- vscode-js configuration for debugging support
      local opt_path = require("lvim.utils").join_paths(get_runtime_dir(), "site", "pack", "lazy", "opt")

      dap_vscode_js.setup {
        node_path = "node",
        debugger_path = opt_path .. "/vscode-js-debug",
        adapters = { "pwa-node", "node-terminal", "pwa-chrome", "pwa-msedge" },
      }

      for _, lang in pairs { "javascript", "typescript", "javascriptreact", "typescriptreact" } do
        dap.configurations[lang] = {
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch file with Node",
            program = "${file}",
            cwd = "${workspaceFolder}",
          },
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch file with Deno",
            runtimeExecutable = "deno",
            runtimeArgs = {
              "run",
              "--inspect-wait",
              "--allow-all",
            },
            program = "${file}",
            cwd = "${workspaceFolder}",
            attachSimplePort = 9229,
          },
          {
            name = "Launch Chrome",
            type = "pwa-chrome",
            request = "launch",
            reAttach = true,
            url = "http://localhost:8080",
            webRoot = "${workspaceFolder}",
          },
        }
      end
    end,
  },
}

return M
