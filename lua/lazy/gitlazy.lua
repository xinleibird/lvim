local M = {
  {
    "gitlazy",
    dir = get_config_dir() .. "/plugins/gitlazy",
    event = "VeryLazy",
    dependencies = {
      "vimpostor/vim-lumen",
    },
    config = function()
      require("gitlazy").setup()
      -- lvim.builtin.which_key.mappings.g.g = { "<CMD>lua require 'gitlazy'.open()<CR>", "Lazygit" }
    end,
  },
}

return M
