local M = {
  "echasnovski/mini.indentscope",
  version = false,
  event = "BufRead",
  enable = not lvim.builtin.indentlines.active,
  init = function()
    vim.api.nvim_create_autocmd({ "FileType" }, {
      pattern = {
        "alpha",
        "dashboard",
        "dap-repl",
        "fzf",
        "help",
        "lazy",
        "lspinfo",
        "mason",
        "notify",
        "NvimTree",
        "qf",
        "TelescopePrompt",
        "toggleterm",
      },
      group = vim.api.nvim_create_augroup("user_mini_indentspace_group", { clear = true }),
      callback = function()
        ---@diagnostic disable: inject-field
        vim.b.miniindentscope_disable = true
        vim.schedule(function()
          ---@diagnostic disable: undefined-global
          if MiniIndentscope then
            MiniIndentscope.undraw()
          end
        end)
      end,
    })
  end,
  config = function()
    require("mini.indentscope").setup {
      draw = {
        delay = 100,
      },
      symbol = "▏",
    }
  end,
}

return M
