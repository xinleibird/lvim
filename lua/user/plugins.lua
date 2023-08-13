lvim.plugins = {
  { "tpope/vim-surround" },
  { "tpope/vim-repeat" },
  { "vimpostor/vim-lumen" },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup {
        -- flavour = "mocha", -- latte, frappe, macchiato, mocha
        background = {
          -- :h background
          light = "latte",
          dark = "mocha",
        },
        transparent_background = false,
        show_end_of_buffer = false, -- show the '~' characters after the end of buffers
        term_colors = true,
        dim_inactive = {
          enabled = false,
          shade = "dark",
          percentage = 0.15,
        },
        no_italic = false, -- Force no italic
        no_bold = false, -- Force no bold
        styles = {
          comments = { "italic" },
          conditionals = { "italic" },
          loops = {},
          functions = {},
          keywords = { "italic" },
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
        },
        color_overrides = {},
        custom_highlights = {},
        integrations = {
          alpha = true,
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          telescope = true,
          notify = false,
          mini = false, -- https://github.com/catppuccin/nvim#integrations
        },
      }
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    config = function()
      require("kanagawa").setup {
        compile = false, -- enable compiling the colorscheme
        undercurl = false, -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = false,
        dimInactive = false, -- dim inactive window `:h hl-NormalNC`
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
              italic = true,
            },
            ["@lsp.typemod.variable.local"] = { link = "@variable" },
            ["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
          }
        end,
        theme = "dragon", -- Load "wave" theme when 'background' option is not set
        background = {
          -- map the value of 'background' option to a theme
          dark = "dragon", -- try "dragon" !
          light = "lotus",
        },
      }
    end,
  },
  {
    "ethanholz/nvim-lastplace",
    config = function()
      require("nvim-lastplace").setup {
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
        lastplace_open_folds = true,
      }
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      -- lsp_signature attach
      lvim.lsp.on_attach_callback = function()
        require("lsp_signature").on_attach()
      end
    end,
  },
  {
    "xinleibird/vim-vsc-snippets",
    config = function()
      local paths =
        require("lvim.utils").join_paths(get_runtime_dir(), "site", "pack", "lazy", "opt", "vim-vsc-snippets")
      require("luasnip.loaders.from_vscode").lazy_load { paths = paths }
    end,
  },
  {
    "tiagovla/scope.nvim",
    config = function()
      require("scope").setup()
    end,
  },
  {
    "unblevable/quick-scope",
    init = function()
      vim.g.qs_highlight_on_keys = { "f", "F", "t", "T" }
      vim.api.nvim_create_autocmd({ "ColorScheme" }, {
        pattern = "*",
        callback = function()
          vim.cmd "highlight QuickScopePrimary guifg='#fdfefe' gui=underline ctermfg=155 cterm=underline"
          vim.cmd "highlight QuickScopeSecondary guifg='#707b7c' gui=underline ctermfg=81 cterm=underline"
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
        rgb = true, -- #rgb hex codes
        rrggbb = true, -- #rrggbb hex codes
        rrggbbaa = true, -- #rrggbbaa hex codes
        rgb_fn = true, -- css rgb() and rgba() functions
        hsl_fn = true, -- css hsl() and hsla() functions
        css = true, -- enable all css features: rgb_fn, hsl_fn, names, rgb, rrggbb
        css_fn = true, -- enable all css *functions*: rgb_fn, hsl_fn
      })
    end,
  },
  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require("symbols-outline").setup {
        width = 20,
        auto_close = true,
      }
    end,
  },
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

      dap.configurations.javascript = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch file with Node",
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
      }

      dap.configurations.typescript = {
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

      for _, lang in pairs { "javascriptreact", "typescriptreact" } do
        dap.configurations[lang] = {
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
