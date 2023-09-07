local M = {
  {
    "simrat39/symbols-outline.nvim",
    config = function()
      -- Outline Toggle
      lvim.builtin.which_key.mappings.o = { ":SymbolsOutline<CR>", "Outline" }
      require("symbols-outline").setup {
        width = 20,
        auto_close = false,
      }
    end,
  },
}

return M
