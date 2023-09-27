local M = {
  {
    "stevearc/aerial.nvim",
    opts = {},
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      lvim.builtin.which_key.mappings.o = { ":AerialToggle<CR>", "Outline" }
      require("aerial").setup {
        -- Priority list of preferred backends for aerial.
        -- This can be a filetype map (see :help aerial-filetype-map)
        -- backends = { "treesitter", "lsp", "markdown", "man" },
        backends = { "lsp", "treesitter", "markdown", "man" },
        -- backends = {
        --   ["_"] = { "lsp", "treesitter" },
        -- },

        icons = {
          Class = lvim.icons.kind.Class,
          Color = lvim.icons.kind.Color,
          Constant = lvim.icons.kind.Constant,
          Constructor = lvim.icons.kind.Constructor,
          Enum = lvim.icons.kind.Enum,
          EnumMember = lvim.icons.kind.EnumMember,
          Event = lvim.icons.kind.Event,
          Field = lvim.icons.kind.Field,
          File = lvim.icons.kind.File,
          Folder = lvim.icons.kind.Folder,
          Function = lvim.icons.kind.Function,
          Interface = lvim.icons.kind.Interface,
          Keyword = lvim.icons.kind.Keyword,
          Method = lvim.icons.kind.Method,
          Module = lvim.icons.kind.Module,
          Operator = lvim.icons.kind.Operator,
          Package = lvim.icons.kind.Package,
          Property = lvim.icons.kind.Property,
          Reference = lvim.icons.kind.Reference,
          Snippet = lvim.icons.kind.Snippet,
          String = lvim.icons.kind.String,
          Struct = lvim.icons.kind.Struct,
          Text = lvim.icons.kind.Text,
          Unit = lvim.icons.kind.Unit,
          Value = lvim.icons.kind.Value,
          Variable = lvim.icons.kind.Variable,
          Collapsed = "󰇘",
        },
        layout = {
          -- These control the width of the aerial window.
          -- They can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
          -- min_width and max_width can be a list of mixed types.
          -- max_width = {40, 0.2} means "the lesser of 40 columns or 20% of total"
          max_width = { 40, 0.2 },
          width = nil,
          min_width = 30,
        },

        -- Customize the characters used when show_guides = true
        show_guides = true,
        guides = {
          -- When the child item has a sibling below it
          mid_item = "├╴",
          -- When the child item is the last in the list
          last_item = "└╴",
          -- When there are nested child guides to the right
          nested_top = "│ ",
          -- Raw indentation
          whitespace = "  ",
        },

        filter_kind = false,
      }
    end,
  },
}
return M
