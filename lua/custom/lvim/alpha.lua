-- Enable dashboard
-- lvim.builtin.alpha.active = false

-- lvim.builtin.alpha.dashboard.section.header.val = require("libs.banner").generate()
-- lvim.builtin.alpha.dashboard.section.header.opts.hl = "Label"
-- lvim.builtin.alpha.dashboard.section.buttons.opts.hl_shortcut = "Include"

vim.api.nvim_create_autocmd({ "FileType" }, {
  group = vim.api.nvim_create_augroup("user_alpha_mouse_group", { clear = true }),
  callback = function()
    if vim.bo.ft == "alpha" then
      vim.opt.mouse = "c"
    else
      vim.opt.mouse = "a"
    end
  end,
})
