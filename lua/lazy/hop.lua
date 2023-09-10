local M = {
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()

      vim.keymap.set("", "s", function()
        require("hop").hint_char2()
      end, { remap = true })
      vim.keymap.set("", "S", function()
        require("hop").hint_words()
      end, { remap = true })
      vim.keymap.set("", "f", function()
        require("hop").hint_words { direction = require("hop.hint").HintDirection.AFTER_CURSOR, current_line_only = true }
      end, { remap = true })
      vim.keymap.set("", "F", function()
        require("hop").hint_words {
          direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
          current_line_only = true,
        }
      end, { remap = true })
      vim.keymap.set("", "t", function()
        require("hop").hint_words {
          direction = require("hop.hint").HintDirection.AFTER_CURSOR,
          current_line_only = true,
          hint_offset = 1,
        }
      end, { remap = true })
      vim.keymap.set("", "T", function()
        require("hop").hint_words {
          direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
          current_line_only = true,
          hint_offset = 1,
        }
      end, { remap = true })
    end,
  },
}

return M
