return {
  "rcarriga/nvim-notify",
  priority = 1000,
  config = function()
    require("notify").setup {
      render = "default",
      timeout = 1000,
      stages = "static",
      top_down = true,
    }
    vim.notify = require "notify"
  end,
}
