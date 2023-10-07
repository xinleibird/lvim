local M = {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "sindrets/diffview.nvim",
      "ibhagwan/fzf-lua",
    },
    config = function()
      require("neogit").setup {
        signs = {
          -- { CLOSED, OPENED }
          hunk = { "", "" },
          item = { "", "" },
          section = { "", "" },
        },
        kind = "auto",
      }
      lvim.builtin.which_key.mappings.g.g = { "<CMD>Neogit<CR>", "Neogit" }

      vim.api.nvim_create_autocmd("User", {
        pattern = {
          "NeogitStatusRefreshed",
          "NeogitCommitComplete",
          "NeogitPushComplete",
          "NeogitPullComplete",
          "NeogitFetchComplete",
        },
        group = vim.api.nvim_create_augroup("user_geogit_auto_refresh_nvimtree", { clear = true }),
        command = "NvimTreeRefresh",
      })
    end,
  },
}

return M
