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

  lvim.builtin.which_key.mappings.g.g = { "<CMD>lua require 'gitlazy'.toggle()<CR>", "Lazygit" }
end

local function get_script_path()
  local str = debug.getinfo(2, "S").source:sub(2)
  return str:match "(.*/)"
end

M.toggle = function()
  local ok, term = pcall(require, "toggleterm.terminal")
  if ok then
    local columns = vim.o.columns
    local lines = vim.o.lines
    local color_dir = get_script_path() .. "/colors/"

    local Terminal = term.Terminal
    local lazygit = Terminal:new {
      cmd = "lazygit -ucf " .. color_dir .. vim.g.gitlazy_color_mode .. ".yml",
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
end

return M
