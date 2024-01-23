local M = {
  {
    "hedyhli/outline.nvim",
    config = function()
      -- Example mapping to toggle outline
      lvim.builtin.which_key.mappings.o = { "<CMD>Outline<CR>", "Outline" }
      require("outline").setup {
        -- Your setup opts here (leave empty to use defaults)
      }
    end,
  },
}

return M
