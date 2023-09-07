local M = {
  {
    "togglesemi",
    dir = get_config_dir() .. "/plugins/togglesemi",
    config = function()
      require("togglesemi").setup()
    end,
  },
}

return M
