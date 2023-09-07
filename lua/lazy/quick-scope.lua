local M = {
  {
    "unblevable/quick-scope",
    init = function()
      vim.g.qs_highlight_on_keys = { "f", "F", "t", "T" }
      vim.api.nvim_create_autocmd({ "ColorScheme" }, {
        pattern = "*",
        callback = function()
          vim.cmd "highlight QuickScopePrimary guifg='#EC1424' gui=underline ctermfg=196 cterm=underline"
          vim.cmd "highlight QuickScopeSecondary guifg='#6F0008' gui=underline ctermfg=52 cterm=underline"
        end,
      })
    end,
  },
}

return M
