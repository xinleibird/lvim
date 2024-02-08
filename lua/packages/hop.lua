local M = {
  "phaazon/hop.nvim",
  event = "BufRead",
  config = function()
    local hop = require "hop"
    local directions = require("hop.hint").HintDirection

    hop.setup()

    vim.api.nvim_create_autocmd({ "FileType" }, {
      group = vim.api.nvim_create_augroup("user_hop_group", { clear = true }),
      callback = function()
        if vim.bo.ft ~= "alpha" then
          vim.keymap.set("", "s", function()
            hop.hint_words()
          end, { remap = true, buffer = true, silent = true })

          vim.keymap.set("", "f", function()
            hop.hint_words { direction = directions.AFTER_CURSOR, current_line_only = true }
          end, { remap = true, buffer = true, silent = true })

          vim.keymap.set("", "F", function()
            hop.hint_words { direction = directions.BEFORE_CURSOR, current_line_only = true }
          end, { remap = true, buffer = true, silent = true })

          vim.keymap.set("", "t", function()
            hop.hint_words { direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 }
          end, { remap = true, buffer = true, silent = true })

          vim.keymap.set("", "T", function()
            hop.hint_words { direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 }
          end, { remap = true, buffer = true, silent = true })
        end
      end,
    })
  end,
}

return M
