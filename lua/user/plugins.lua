-- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
lvim.plugins = {
  { "tpope/vim-surround" },
  { "tpope/vim-repeat" },
  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require('symbols-outline').setup()
    end
  },
  {
    "unblevable/quick-scope",
    init = function()
      vim.g.qs_highlight_on_keys = { 'f', 'F', 't', 'T' }
      vim.api.nvim_create_autocmd({ "ColorScheme" }, {
        pattern = "*",
        callback = function()
          vim.cmd("highlight QuickScopePrimary guifg='#e3f5ff' gui=underline ctermfg=155 cterm=underline")
          vim.cmd("highlight QuickScopeSecondary guifg='#6b' gui=underline ctermfg=81 cterm=underline")
        end,
      })
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "css", "scss", "html", "javascript" }, {
        rgb = true,      -- #rgb hex codes
        rrggbb = true,   -- #rrggbb hex codes
        rrggbbaa = true, -- #rrggbbaa hex codes
        rgb_fn = true,   -- css rgb() and rgba() functions
        hsl_fn = true,   -- css hsl() and hsla() functions
        css = true,      -- enable all css features: rgb_fn, hsl_fn, names, rgb, rrggbb
        css_fn = true,   -- enable all css *functions*: rgb_fn, hsl_fn
      })
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require "lsp_signature".on_attach() end,
    -- lazy = true
  },
  {
    "xinleibird/vim-vsc-snippets",
    config = function()
      local path = require("lvim.utils").join_paths(get_runtime_dir(), "site", "pack", "lazy", "opt", "vim-vsc-snippets")
      require("luasnip.loaders.from_vscode").lazy_load({ paths = path })
    end,
  },
  {
    "mxsdev/nvim-dap-vscode-js",
    event = "VeryLazy",
    dependencies = {
      "mfussenegger/nvim-dap",
      {
        "microsoft/vscode-js-debug",
        module = true,
        build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
      }
    },
    config = function()
      local dap_vscode_js = require("dap-vscode-js")
      -- vscode-js configuration for debugging support
      local debug_path = require("lvim.utils").join_paths(get_runtime_dir(), "site", "pack", "lazy", "opt",
        "vscode-js-debug")
      dap_vscode_js.setup({
        node_path = "node",
        debugger_path = debug_path,
        adapters = { "pwa-node", "node-terminal", "pwa-chrome", "pwa-msedge" },
      })
      for _, language in ipairs { "typescript", "javascript" } do
        require("dap").configurations[language] = {
          {
            type = "pwa-chrome",
            name = "attach - attach remote debugging",
            request = "attach",
            program = "${file}",
            cwd = vim.fn.getcwd(),
            sourcemaps = true,
            protocol = "inspector",
            port = 9222,
            webroot = "${workspacefolder}",
          },
          {
            type = "pwa-chrome",
            name = "Launch - Launch Chrome Process",
            request = "launch",
            url = "http://localhost:8080",
            browserLaunchLocation = "workspace",
          },
        }
      end
    end
  },
}
