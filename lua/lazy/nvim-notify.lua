local M = {
  {
    "rcarriga/nvim-notify",
    config = function()
      vim.notify = require "notify"
      vim.api.nvim_create_autocmd({ "VimEnter", "VimResized" }, {
        callback = function()
          local columns = vim.o.columns
          if columns < 83 then
            require("notify").setup {
              render = "default",
              timeout = 1000,
              stages = "static",
              top_down = false,
            }
          else
            require("notify").setup {
              render = "default",
              timeout = 1000,
              stages = "static",
              top_down = true,
            }
          end
        end,
      })
    end,
  },
}

return M
