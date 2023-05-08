-- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
lvim.plugins = {
  { "tpope/vim-surround" },
  { "tpope/vim-repeat" },
  { "AndrewRadev/inline_edit.vim" },
  {
    "rebelot/kanagawa.nvim",
    config = function()
      require('kanagawa').setup({
        compile = false,  -- enable compiling the colorscheme
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = true,    -- do not set background color
        dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        colors = {
          -- add/modify theme and palette colors
          palette = {},
          theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
        },
        overrides = function(colors) -- add/modify highlights
          return {
            ["@tag.attribute.html"] = {
              fg = colors.palette.dragonYellow,
              bold = false,
              italic = true
            }
          }
        end,
        theme = "wave", -- Load "wave" theme when 'background' option is not set
        background = {
          -- map the value of 'background' option to a theme
          dark = "dragon", -- try "dragon" !
          light = "lotus"
        },
      })
    end
  },
  {
    "ethanholz/nvim-lastplace",
    config = function()
      require 'nvim-lastplace'.setup {
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
        lastplace_open_folds = true
      }
    end
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
  },
  {
    "xinleibird/cmp-emmet",
    build = "npm run release",
  },
  {
    "xinleibird/vim-vsc-snippets",
    config = function()
      local paths = require("lvim.utils").join_paths(get_runtime_dir(), "site", "pack", "lazy", "opt", "vim-vsc-snippets")
      require("luasnip.loaders.from_vscode").lazy_load({ paths = paths })
    end,
  },
  {
    "tiagovla/scope.nvim",
    config = function()
      require("scope").setup()
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
    "simrat39/symbols-outline.nvim",
    config = function()
      require('symbols-outline').setup({
        width = 20,
        auto_close = true,
      })
    end
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
