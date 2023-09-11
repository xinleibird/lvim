local M = {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = {
      "mason.nvim",
      "mason-lspconfig.nvim",
    },
    config = function()
      require("mason-tool-installer").setup {
        ensure_installed = {
          "eslint_d",
          "goimports",
          "jsonlint",
          "prettierd",
          "shellcheck",
          "shfmt",
          "stylua",
          "vint",
        },
        auto_update = false,
        run_on_start = true,
        start_delay = 3000, -- 3 second delay
      }
    end,
  },
}

return M
