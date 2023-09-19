local M = {
  {
    "lukas-reineke/virt-column.nvim",
    tag = "v1.5.6",
    config = function()
      require("virt-column").setup { char = "▏" }

      vim.api.nvim_create_autocmd({ "BufRead", "FileType" }, {
        pattern = {
          "javascript",
          "typescript",
          "javascriptreact",
          "typescriptreact",
          "vue",
          "lua",
          "go",
          "rust",
          "html",
          "css",
        },
        callback = function()
          require("virt-column").setup_buffer { virtcolumn = "80,110" }
        end,
      })
    end,
  },
}

return M
