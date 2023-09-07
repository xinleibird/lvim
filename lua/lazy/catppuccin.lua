local M = {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      local catppuccin_bufferline = require "catppuccin.groups.integrations.bufferline"
      lvim.builtin.bufferline.highlights = catppuccin_bufferline.get()

      require("catppuccin").setup {
        -- flavour = "mocha", -- latte, frappe, macchiato, mocha
        background = {
          light = "latte",
          dark = "frappe",
        },
        transparent_background = false,
        show_end_of_buffer = false, -- show the '~' characters after the end of buffers
        term_colors = true,
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
          }
        end,
        integrations = {
          alpha = true,
          cmp = true,
          dashboard = true,
          gitsigns = true,
          mason = true,
          mini = true, -- https://github.com/catppuccin/nvim#integrations,
          noice = true,
          notify = true,
          nvimtree = true,
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
