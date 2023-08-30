local M = {}
M.setup = function(opt)
  local dark_theme = "frappe"
  local light_theme = "latte"

  if opt ~= nil then
    if opt.dark_theme ~= nil then
      dark_theme = opt.dark_theme
    end
    if opt.light_theme ~= nil then
      light_theme = opt.light_theme
    end
  end

  -- local mode = vim.split(vim.cmd "silent set background" or "background=dark", "=")[1]
  local mode = vim.o.background

  if mode == "dark" then
    vim.g.gitlazy_color_mode = dark_theme
  else
    vim.g.gitlazy_color_mode = light_theme
  end

  vim.api.nvim_create_autocmd("User", {
    pattern = "LumenDark",
    callback = function()
      vim.g.gitlazy_color_mode = dark_theme
    end,
  })

  vim.api.nvim_create_autocmd("User", {
    pattern = "LumenLight",
    callback = function()
      vim.g.gitlazy_color_mode = light_theme
    end,
  })
end

M.toggle = function()
  local columns = vim.o.columns
  local lines = vim.o.lines

  local Terminal = require("toggleterm.terminal").Terminal
  local lazygit = Terminal:new {
    cmd = "lazygit -ucf " .. "~/.config/lazygit/" .. vim.g.gitlazy_color_mode .. ".yml",
    hidden = true,
    direction = "float",
    float_opts = {
      border = "none",
      width = columns,
      height = lines,
    },
    on_open = function(_)
      vim.cmd "startinsert!"
    end,
    on_close = function(_) end,
    count = 99,
  }
  lazygit:toggle()
end

return M
