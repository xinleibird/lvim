local M = {
  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup {
        render = "wrapped-compact",
        timeout = 1000,
        stages = "static",
        top_down = true,
        max_width = 80,
      }
      vim.notify = require "notify"
    end,
  },
}

return M
