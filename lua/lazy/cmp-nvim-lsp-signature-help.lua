local M = {
  {
    "hrsh7th/cmp-nvim-lsp-signature-help",
    event = "BufRead",
    config = function()
      table.insert(lvim.builtin.cmp.sources, { name = "nvim_lsp_signature_help" })
    end,
  },
}

return M
