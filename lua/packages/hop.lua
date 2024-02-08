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
          vim.keymap.set("n", "s", function()
            hop.hint_words()
          end, { remap = true, buffer = true, silent = true, desc = "Hop Motion buffer" })

          vim.keymap.set({ "n", "v", "x" }, "f", function()
            hop.hint_words { direction = directions.AFTER_CURSOR, current_line_only = true }
          end, { remap = true, buffer = true, silent = true, desc = "Hop Motion current Line" })

          vim.keymap.set({ "n", "v", "x" }, "F", function()
            hop.hint_words { direction = directions.BEFORE_CURSOR, current_line_only = true }
          end, { remap = true, buffer = true, silent = true, desc = "Hop Motion current line" })

          vim.keymap.set({ "n", "v", "x" }, "t", function()
            hop.hint_words { direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 }
          end, { remap = true, buffer = true, silent = true, desc = "Hop Motion current line" })

          vim.keymap.set({ "n", "v", "x" }, "T", function()
            hop.hint_words { direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 }
          end, { remap = true, buffer = true, silent = true, desc = "Hop Motion current line" })
        end
      end,
    })
  end,
}

return M
