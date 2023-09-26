local M = {
  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup {
        render = "default",
        timeout = 1000,
        stages = "static",
        top_down = true,
      }
      vim.notify = require "notify"
    end,
  },
}

return M
