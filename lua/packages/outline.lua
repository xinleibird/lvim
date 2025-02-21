local M = {
  "hedyhli/outline.nvim",
  event = "BufRead",
  init = function()
    lvim.builtin.which_key.mappings.o = { "<CMD>Outline<CR>", "Outline" }
  end,
  config = function()
    -- Example mapping to toggle outline
    require("outline").setup {
      outline_window = {
        position = "right",
        width = 30,
        relative_width = false,
        focus_on_open = false,
        jump_highlight_duration = false,
      },
      outline_items = {
        -- Show extra details with the symbols (lsp dependent) as virtual next
        show_symbol_details = true,
        -- Show corresponding line numbers of each symbol on the left column as
        -- virtual text, for quick navigation when not focused on outline.
        -- Why? See this comment:
        -- https://github.com/simrat39/symbols-outline.nvim/issues/212#issuecomment-1793503563
        show_symbol_lineno = false,
        -- Whether to highlight the currently hovered symbol and all direct parents
        highlight_hovered_item = true,
        -- Whether to automatically set cursor location in outline to match
        -- location in code when focus is in code. If disabled you can use
        -- `:OutlineFollow[!]` from any window or `<C-g>` from outline window to
        -- trigger this manually.
        auto_set_cursor = true,
        -- Autocmd events to automatically trigger these operations.
        auto_update_events = {
          -- Includes both setting of cursor and highlighting of hovered item.
          -- The above two options are respected.
          -- This can be triggered manually through `follow_cursor` lua API,
          -- :OutlineFollow command, or <C-g>.
          follow = { "CursorMoved" },
          -- Re-request symbols from the provider.
          -- This can be triggered manually through `refresh_outline` lua API, or
          -- :OutlineRefresh command.
          items = { "InsertLeave", "WinEnter", "BufEnter", "BufWinEnter", "TabEnter", "BufWritePost" },
        },
      },
      symbols = {
        icons = {
          File = { icon = lvim.icons.kind.File, hl = "Identifier" },
          Module = { icon = lvim.icons.kind.Module, hl = "Include" },
          Namespace = { icon = lvim.icons.kind.Namespace, hl = "Include" },
          Package = { icon = lvim.icons.kind.Package, hl = "Include" },
          Class = { icon = lvim.icons.kind.Class, hl = "Type" },
          Method = { icon = lvim.icons.kind.Method, hl = "Function" },
          Property = { icon = lvim.icons.kind.Property, hl = "Identifier" },
          Field = { icon = lvim.icons.kind.Field, hl = "Identifier" },
          Constructor = { icon = lvim.icons.kind.Constructor, hl = "Special" },
          Enum = { icon = lvim.icons.kind.Enum, hl = "Type" },
          Interface = { icon = lvim.icons.kind.Interface, hl = "Type" },
          Function = { icon = lvim.icons.kind.Function, hl = "Function" },
          Variable = { icon = lvim.icons.kind.Variable, hl = "Constant" },
          Constant = { icon = lvim.icons.kind.Constant, hl = "Constant" },
          String = { icon = lvim.icons.kind.String, hl = "String" },
          Number = { icon = lvim.icons.kind.Number, hl = "Number" },
          Boolean = { icon = lvim.icons.kind.Boolean, hl = "Boolean" },
          Array = { icon = lvim.icons.kind.Array, hl = "Constant" },
          Object = { icon = lvim.icons.kind.Object, hl = "Type" },
          Key = { icon = lvim.icons.kind.Key, hl = "Type" },
          Null = { icon = lvim.icons.kind.Null, hl = "Type" },
          EnumMember = { icon = lvim.icons.kind.EnumMember, hl = "Identifier" },
          Struct = { icon = lvim.icons.kind.Struct, hl = "Structure" },
          Event = { icon = lvim.icons.kind.Event, hl = "Type" },
          Operator = { icon = lvim.icons.kind.Operator, hl = "Identifier" },
          TypeParameter = { icon = lvim.icons.kind.TypeParameter, hl = "Identifier" },
          Component = { icon = lvim.icons.kind.Component, hl = "Function" },
          Fragment = { icon = "󰅴", hl = "Constant" },
          TypeAlias = { icon = "", hl = "Type" },
          Parameter = { icon = lvim.icons.kind.TypeParameter, hl = "Identifier" },
          StaticMethod = { icon = lvim.icons.kind.Method, hl = "Function" },
          Macro = { icon = "󰘨", hl = "Function" },
        },
      },
    }
  end,
}

return M
