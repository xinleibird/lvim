local M = {
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
      vim.keymap.set("", "s", function()
        require("hop").hint_words()
      end, { remap = true })
    end,
  },
}

return M
