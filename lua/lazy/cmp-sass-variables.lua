local M = {
  {
    "pontusk/cmp-sass-variables",
    event = "BufRead",
    config = function()
      vim.g.sass_variables_file = "_variables.scss"
      table.insert(lvim.builtin.cmp.sources, { name = "sass-variables" })
    end,
  },
}

return M
