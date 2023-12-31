local M = {
  {
    "phaazon/hop.nvim",
    config = function()
      require("hop").setup()
      vim.keymap.set("", "s", function()
        require("hop").hint_words()
      end, { remap = true })
    end,
  },
}

return M
