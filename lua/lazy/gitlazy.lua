local M = {
  {
    "gitlazy",
    dir = get_config_dir() .. "/plugins/gitlazy",
    dependencies = {
      "vimpostor/vim-lumen",
    },
    config = function()
      require("gitlazy").setup()
      -- lvim.builtin.which_key.mappings.g.g = { "<CMD>lua require 'gitlazy'.toggle()<CR>", "Lazygit" }
    end,
  },
}

return M
