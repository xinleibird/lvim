local M = {
  "gitlazy",
  dir = get_config_dir() .. "/plugins/gitlazy",
  event = "VimEnter",
  dependencies = {
    "vimpostor/vim-lumen",
  },
  config = function()
    require("gitlazy").setup()
    lvim.builtin.which_key.mappings.g.g = { "<CMD>lua require 'gitlazy'.open()<CR>", "GitLazy" }
  end,
}

return M
