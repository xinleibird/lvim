local M = {
  "gitlazy",
  dir = get_config_dir() .. "/plugins/gitlazy",
  event = "VimEnter",
  dependencies = {
    "vimpostor/vim-lumen",
  },
  config = function()
    require("gitlazy").setup()
    lvim.builtin.which_key.mappings.g.g = {
      function()
        require("gitlazy").open()
      end,
      "GitLazy",
    }
  end,
}

return M
