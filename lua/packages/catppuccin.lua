local M = {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    local catppuccin_bufferline = require "catppuccin.groups.integrations.bufferline"
    lvim.builtin.bufferline.highlights = catppuccin_bufferline.get()

    lvim.builtin.lualine.options.theme = "catppuccin"

    require("catppuccin").setup {
      -- flavour = "frappe", -- latte, frappe, macchiato, mocha
      background = {
        light = "latte",
        dark = "frappe",
      },
      compile_path = vim.fn.stdpath "cache" .. "/catppuccin",
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
      no_underline = false,
      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = { "italic", "bold" },
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      color_overrides = {},
      highlight_overrides = {},
      custom_highlights = function(colors)
        return {
          CmpItemMenu = { fg = colors.teal },
          IlluminatedWordText = { bg = colors.crust },
          IlluminatedWordRead = { bg = colors.crust },
          IlluminatedWordWrite = { bg = colors.crust },
          VirtColumn = { fg = colors.surface0 },
          OutlineGuides = { fg = colors.mantle },
          ["@tag.attribute"] = { fg = colors.yellow, style = { "italic" } },
          EyelinerPrimary = { fg = colors.peach, style = { "bold", "underline" } },
          EyelinerSecondary = { fg = colors.sky, style = { "bold" } },
          -- DiagnosticUnnecessary = { link = "DiagnosticUnderlineError" },
          -- DiagnosticDeprecated = { link = "DiagnosticUnderlineError" },
        }
      end,
      integrations = {
        alpha = true,
        cmp = true,
        dap = true,
        dap_ui = true,
        dashboard = true,
        fidget = true,
        gitsigns = true,
        hop = true,
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
        mini = {
          enabled = true,
          indentscope_color = "surface1", -- catppuccin color (eg. `lavender`) Default: text
        },
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
        navic = {
          enabled = false,
          custom_bg = "NONE", -- "lualine" will set background to mantle
        },
        neogit = true,
        notify = true,
        nvimtree = true,
        symbols_outline = true,
        rainbow_delimiters = true,
        semantic_tokens = true,
        telescope = {
          enabled = true,
          -- style = "nvchad",
        },
        treesitter_context = true,
        treesitter = true,
        which_key = true,
      },
    }
  end,
}

return M
