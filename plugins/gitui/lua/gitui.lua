local M = {}

M.setup = function()
  local mode = vim.split(vim.cmd "set background" or "background=dark", "=")[1]

  if mode == "dark" then
    vim.g.gitui_color_mode = "frappe"
  else
    vim.g.gitui_color_mode = "latte"
  end

  vim.api.nvim_create_autocmd("User", {
    pattern = "LumenDark",
    callback = function()
      vim.g.gitui_color_mode = "frappe"
    end,
  })

  vim.api.nvim_create_autocmd("User", {
    pattern = "LumenLight",
    callback = function()
      vim.g.gitui_color_mode = "latte"
    end,
  })

  lvim.builtin.which_key.mappings.g.g = { "<cmd>lua require 'gitui'.toggle()<cr>", "Lazygit" }
end

M.toggle = function()
  local Terminal = require("toggleterm.terminal").Terminal
  local gitui = Terminal:new {
    cmd = "gitui -t " .. vim.g.gitui_color_mode .. ".ron",
    hidden = true,
    direction = "float",
    float_opts = {
      border = "none",
      width = 100000,
      height = 100000,
    },
    on_open = function(_)
      vim.cmd "startinsert!"
    end,
    on_close = function(_) end,
    count = 99,
  }
  gitui:toggle()
end

return M
