local M = {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "nvim-telescope/telescope.nvim", -- optional
      "sindrets/diffview.nvim", -- optional
      -- "ibhagwan/fzf-lua", -- optional
    },
    config = function()
      require("neogit").setup()
      lvim.builtin.which_key.mappings.g.g = { "<CMD>Neogit<CR>", "Neogit" }
    end,
  },
}

return M
