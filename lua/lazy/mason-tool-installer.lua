local M = {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    priority = 1000,
    dependencies = {
      "mason.nvim",
      "mason-lspconfig.nvim",
    },
    config = function()
      require("mason-tool-installer").setup {
        ensure_installed = lvim.lsp.null_ls.setup.ensure_installed,
        auto_update = false,
        run_on_start = true,
        start_delay = 3000, -- 3 second delay
      }
    end,
  },
}

return M
