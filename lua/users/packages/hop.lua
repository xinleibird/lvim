local M = {
  {
    "phaazon/hop.nvim",
    config = function()
      local hop = require "hop"
      hop.setup()
      vim.keymap.set("", "s", function()
        hop.hint_words()
      end, { remap = true })
    end,
  },
}

return M
