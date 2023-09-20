local M = {
  {
    "lukas-reineke/virt-column.nvim",
    config = function()
      require("virt-column").setup {
        char = "▏",
        highlight = "VirtColumn",
      }

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
          require("virt-column").setup_buffer(0, {
            virtcolumn = "80,110",
          })
        end,
      })
    end,
  },
}

return M
