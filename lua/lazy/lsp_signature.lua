local M = {
  {
    "ray-x/lsp_signature.nvim",
    enabled = false,
    event = "BufRead",
    opts = {
      hint_enable = false,
      hint_prefix = "👾 ", -- Panda for parameter, NOTE: for the terminal not support emoji, might crash
      hint_inline = function()
        return vim.fn.has "nvim_0.10" == 1
      end,
      padding = "", -- character to pad on left and right of signature can be ' ', or '|'  etc
      timer_interval = 500, -- default timer check interval set to lower value if you want to reduce latency
    },
    config = function(_, opts)
      require("lsp_signature").setup(opts)
      require("lsp_signature").on_attach()
    end,
    -- config = function(_, opts)
    --   require("lsp_signature").setup(opts)
    -- end,
  },
}

return M
