local M = {}

M.setup = function(opt)
  local dark_theme = "frappe"
  local light_theme = "latte"

  if opt ~= nil then
    if opt.dark_theme ~= nil then
      dark_theme = opt.dark_theme
    end
    if opt.light_theme ~= nil then
      light_theme = opt.dark_theme
    end
  end

  local mode = vim.split(vim.cmd "silent set background" or "background=dark", "=")[1]

  if mode == "dark" then
    vim.g.gitui_color_mode = dark_theme
  else
    vim.g.gitui_color_mode = light_theme
  end

  vim.api.nvim_create_autocmd("User", {
    pattern = "LumenDark",
    callback = function()
      vim.g.gitui_color_mode = dark_theme
    end,
  })

  vim.api.nvim_create_autocmd("User", {
    pattern = "LumenLight",
    callback = function()
      vim.g.gitui_color_mode = light_theme
    end,
  })

  lvim.builtin.which_key.mappings.g.g = { "<CMD>lua require 'gitui'.toggle()<CR>", "GitUI" }
end

M.toggle = function()
  local columns = vim.api.nvim_win_get_width(0)
  local rows = vim.api.nvim_win_get_height(0)

  local Terminal = require("toggleterm.terminal").Terminal
  local gitui = Terminal:new {
    cmd = "gitui -t " .. vim.g.gitui_color_mode .. ".ron",
    hidden = true,
    direction = "float",
    float_opts = {
      border = "none",
      width = columns,
      height = rows,
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
