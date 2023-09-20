local M = {}

M.toggle = function(character)
  local delimiters = { ",", ";" }
  local line = vim.api.nvim_get_current_line()
  local last_char = line:sub(-1)

  if last_char == character then
    return vim.api.nvim_set_current_line(line:sub(1, #line - 1))
  elseif vim.tbl_contains(delimiters, last_char) then
    return vim.api.nvim_set_current_line(line:sub(1, #line - 1) .. character)
  else
    return vim.api.nvim_set_current_line(line .. character)
  end
end

M.setup = function()
  -- Toggle end of line semi and coma
  vim.keymap.set("n", "<C-,>", function()
    require("togglesemi").toggle ","
  end, { noremap = true, silent = true })
  vim.keymap.set("n", "<C-;>", function()
    require("togglesemi").toggle ";"
  end, { noremap = true, silent = true })
  vim.keymap.set("i", "<C-,>", function()
    require("togglesemi").toggle ","
  end, { noremap = true, silent = true })
  vim.keymap.set("i", "<C-;>", function()
    require("togglesemi").toggle ";"
  end, { noremap = true, silent = true })
end

return M
