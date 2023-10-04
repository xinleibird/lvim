local M = {
  {
    "lukas-reineke/virt-column.nvim",
    config = function()
      require("virt-column").setup {
        char = "▏",
        highlight = "VirtColumn",
      }

      vim.api.nvim_create_autocmd({ "BufReadPre" }, {
        pattern = lvim.format_on_save.pattern or {},
        callback = function()
          require("virt-column").setup_buffer(0, {
            virtcolumn = "80,110",
          })
        end,
      })
    end,
  },
}

return M
