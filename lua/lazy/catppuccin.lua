local M = {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      local catppuccin_bufferline = require "catppuccin.groups.integrations.bufferline"
      lvim.builtin.bufferline.highlights = catppuccin_bufferline.get()

      require("catppuccin").setup {
        compile_path = vim.fn.stdpath "cache" .. "/catppuccin",
        -- flavour = "mocha", -- latte, frappe, macchiato, mocha
        background = {
          light = "latte",
          dark = "frappe",
        },
        transparent_background = false,
        show_end_of_buffer = false, -- show the '~' characters after the end of buffers
        term_colors = false,
        dim_inactive = {
          enabled = false,
          shade = "dark",
          percentage = 0.62,
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
        custom_highlights = function(colors)
          return {
            CmpItemMenu = { fg = colors.teal },
            IlluminatedWordText = { bg = colors.crust },
            IlluminatedWordRead = { bg = colors.crust },
            IlluminatedWordWrite = { bg = colors.crust },
            NvimTreeNormal = { fg = colors.none },
          }
        end,
        integrations = {
          alpha = true,
          cmp = true,
          dashboard = true,
          dap = {
            enabled = true,
            enable_ui = true, -- enable nvim-dap-ui
          },
          gitsigns = true,
          hop = false,
          illuminate = {
            enabled = true,
            lsp = true,
          },
          indent_blankline = {
            enabled = true,
            colored_indent_levels = false,
          },
          markdown = true,
          mason = true,
          mini = true, -- https://github.com/catppuccin/nvim#integrations,
          native_lsp = {
            enabled = true,
            virtual_text = {
              errors = { "italic" },
              hints = { "italic" },
              warnings = { "italic" },
              information = { "italic" },
            },
            underlines = {
              errors = { "undercurl" },
              hints = { "undercurl" },
              warnings = { "undercurl" },
              information = { "undercurl" },
            },
            inlay_hints = {
              background = true,
            },
          },
          noice = true,
          notify = true,
          nvimtree = true,
          rainbow_delimiters = true,
          symbols_outline = true,
          telescope = {
            enabled = true,
            -- style = "nvchad",
          },
          treesitter = true,
          which_key = true,
        },
      }
    end,
  },
}

return M
