local M = {
  "togglesemi",
  dir = get_config_dir() .. "/plugins/togglesemi",
  event = "BufRead",
  config = function()
    require("togglesemi").setup()
  end,
}

return M
