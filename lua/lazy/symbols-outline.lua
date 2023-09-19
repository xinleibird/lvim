local M = {
  {
    "simrat39/symbols-outline.nvim",
    config = function()
      -- Outline Toggle
      lvim.builtin.which_key.mappings.o = { ":SymbolsOutline<CR>", "Outline" }
      require("symbols-outline").setup {
        width = 20,
        auto_close = false,
        symbols = {
          File = { icon = lvim.icons.kind.File, hl = "@text.uri" },
          Module = { icon = lvim.icons.kind.Module, hl = "@namespace" },
          Namespace = { icon = lvim.icons.kind.Namespace, hl = "@namespace" },
          Package = { icon = lvim.icons.kind.Package, hl = "@namespace" },
          Class = { icon = lvim.icons.kind.Class, hl = "@type" },
          Method = { icon = lvim.icons.kind.Method, hl = "@method" },
          Property = { icon = lvim.icons.kind.Property, hl = "@method" },
          Field = { icon = lvim.icons.kind.Field, hl = "@field" },
          Constructor = { icon = lvim.icons.kind.Constructor, hl = "@constructor" },
          Enum = { icon = lvim.icons.kind.Enum, hl = "@type" },
          Interface = { icon = lvim.icons.kind.Interface, hl = "@type" },
          Function = { icon = lvim.icons.kind.Function, hl = "@function" },
          Variable = { icon = lvim.icons.kind.Variable, hl = "@constant" },
          Constant = { icon = lvim.icons.kind.Constant, hl = "@constant" },
          String = { icon = lvim.icons.kind.String, hl = "@string" },
          Number = { icon = lvim.icons.kind.Number, hl = "@number" },
          Boolean = { icon = lvim.icons.kind.Boolean, hl = "@boolean" },
          Array = { icon = lvim.icons.kind.Array, hl = "@constant" },
          Object = { icon = lvim.icons.kind.Object, hl = "@type" },
          Key = { icon = lvim.icons.kind.Key, hl = "@type" },
          Null = { icon = lvim.icons.kind.Null, hl = "@type" },
          EnumMember = { icon = lvim.icons.kind.EnumMember, hl = "@field" },
          Struct = { icon = lvim.icons.kind.Struct, hl = "@type" },
          Event = { icon = lvim.icons.kind.Event, hl = "@type" },
          Operator = { icon = lvim.icons.kind.Operator, hl = "@operator" },
          TypeParameter = { icon = lvim.icons.kind.TypeParameter, hl = "@parameter" },
          Component = { icon = lvim.icons.kind.Component, hl = "@function" },
          Fragment = { icon = lvim.icons.kind.Fragment, hl = "@constant" },
        },
      }
    end,
  },
}

return M
