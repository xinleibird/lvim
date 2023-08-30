lvim.plugins = {
  { "tpope/vim-surround" },
  { "tpope/vim-repeat" },
  { "vimpostor/vim-lumen" },
  { "HiPhish/rainbow-delimiters.nvim" },
  {
    "togglesemi",
    dir = get_config_dir() .. "/plugins/togglesemi",
    config = function()
      require("togglesemi").setup()
    end,
  },
  {
    "gitui",
    dir = get_config_dir() .. "/plugins/gitui",
    config = function()
      require("gitui").setup { dark_theme = "frappe", light_theme = "latte" }
    end,
  },
  {
    "folke/noice.nvim",
    -- event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      {
        "rcarriga/nvim-notify",
        config = function()
          lvim.builtin.which_key.mappings.s.n =
            { "<CMD>lua require('telescope').extensions.notify.notify()<CR>", "Open Notifies" }
        end,
      },
    },
    config = function()
      require("noice").setup {
        -- ignore file save notify
        -- routes = {
        --   {
        --     filter = {
        --       event = "msg_show",
        --       any = {
        --         { find = "%d+L, %d+B" },
        --         { find = "; after #%d+" },
        --         { find = "; before #%d+" },
        --         { find = "%d fewer lines" },
        --         { find = "%d more lines" },
        --       },
        --     },
        --     opts = { skip = true },
        --   },
        -- },
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = true, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = true, -- add a border to hover docs and signature help
        },
      }
    end,
  },
  {
    "nacro90/numb.nvim",
    event = "BufRead",
    config = function()
      require("numb").setup {
        show_numbers = true, -- Enable 'number' for the window while peeking
        show_cursorline = true, -- Enable 'cursorline' for the window while peeking
      }
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "css", "scss", "html", "javascript" }, {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
      })
    end,
  },
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
          dark = "frappe",
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
        color_overrides = {
          frappe = {
            base = "#313445",
          },
        },
        custom_highlights = {},
        integrations = {
          alpha = true,
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          telescope = true,
          notify = true,
          mini = false, -- https://github.com/catppuccin/nvim#integrations,
          mason = true,
          which_key = true,
          symbols_outline = true,
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
    "L3MON4D3/LuaSnip",
    config = function()
      local utils = require "lvim.utils"
      local paths = {}
      local user_snippets = utils.join_paths(get_config_dir(), "snippets")
      if utils.is_directory(user_snippets) then
        paths[#paths + 1] = user_snippets
      end
      require("luasnip.loaders.from_lua").lazy_load()
      require("luasnip.loaders.from_vscode").lazy_load {
        paths = paths,
        exclude = { "all" },
      }
      require("luasnip.loaders.from_snipmate").lazy_load()
    end,
    event = "InsertEnter",
  },
  { "rafamadriz/friendly-snippets", lazy = true },
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
          vim.cmd "highlight QuickScopePrimary guifg='#EC1424' gui=underline ctermfg=196 cterm=underline"
          vim.cmd "highlight QuickScopeSecondary guifg='#6F0008' gui=underline ctermfg=52 cterm=underline"
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
        auto_close = false,
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
