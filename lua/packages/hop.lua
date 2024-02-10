local M = {
  "phaazon/hop.nvim",
  event = "VimEnter",
  config = function()
    local hop = require "hop"
    hop.setup()
    vim.api.nvim_create_autocmd({ "FileType" }, {
      group = vim.api.nvim_create_augroup("user_hop_group", { clear = true }),
      callback = function()
        if vim.bo.ft ~= "alpha" then
          vim.keymap.set("n", "s", function()
            hop.hint_words()
          end, { remap = true, buffer = true, silent = true, desc = "Hop Motion buffer" })
        end
      end,
    })
  end,
}

return M
