local M = {
  {
    "gitlazy",
    dir = get_config_dir() .. "/plugins/gitlazy",
    dependencies = {
      "vimpostor/vim-lumen",
    },
    config = function()
      require("gitlazy").setup()
    end,
  },
}

return M
