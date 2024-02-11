local M = {
  "lukas-reineke/virt-column.nvim",
  config = function()
    require("virt-column").setup {
      char = "▏",
      highlight = "VirtColumn",
    }

    vim.api.nvim_create_autocmd({ "BufReadPre" }, {
      pattern = lvim.format_on_save.pattern or {},
      group = vim.api.nvim_create_augroup("user_virt_column_group", { clear = true }),
      callback = function()
        require("virt-column").setup_buffer(0, {
          char = "",
          virtcolumn = "80,110",
        })
      end,
    })
  end,
}

return M
