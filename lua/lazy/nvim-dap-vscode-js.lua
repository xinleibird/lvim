local M = {
  {
    "mxsdev/nvim-dap-vscode-js",
    event = "VeryLazy",
    dependencies = {
      {
        "microsoft/vscode-js-debug",
        version = "^1",
        module = true,
        build = "npm clean-install --legacy-peer-deps && npx gulp vsDebugServerBundle && rm -rf out && mv dist out",
      },
    },
    config = function()
      -- vscode-js configuration for debugging support
      local vscode_js_debug_path =
        require("lvim.utils").join_paths(get_runtime_dir(), "site", "pack", "lazy", "opt", "vscode-js-debug")

      require("dap-vscode-js").setup {
        node_path = "node",
        debugger_path = vscode_js_debug_path,
        -- debugger_cmd = { "vscode-js-debug" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
        adapters = {
          "chrome",
          "node",
          "node-terminal",
          "pwa-chrome",
          "pwa-extensionHost",
          "pwa-msedge",
          "pwa-node",
        },
      }

      local langs = {
        "javascript",
        "typescript",
        "javascriptreact",
        "typescriptreact",
      }

      for _, lang in pairs(langs) do
        require("dap").configurations[lang] = {
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch with Node",
            program = "${file}",
            cwd = "${workspaceFolder}",
          },
          {
            name = "Launch Chrome",
            type = "pwa-chrome",
            request = "launch",
            reAttach = true,
            url = "http://localhost:8080",
            webRoot = "${workspaceFolder}",
          },
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch with Deno",
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
            type = "pwa-node",
            request = "attach",
            name = "Attach into Node",
            processId = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
          },
        }
      end
    end,
  },
}

return M
