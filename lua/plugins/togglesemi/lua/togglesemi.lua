local M = {}

M.toggle = function(character)
  local api = vim.api
  local delimiters = { ",", ";" }
  local line = api.nvim_get_current_line()
  local last_char = line:sub(-1)

  if last_char == character then
    return api.nvim_set_current_line(line:sub(1, #line - 1))
  elseif vim.tbl_contains(delimiters, last_char) then
    return api.nvim_set_current_line(line:sub(1, #line - 1) .. character)
  else
    return api.nvim_set_current_line(line .. character)
  end
end

M.setup = function()
  -- Toggle end of line semi and coma
  vim.api.nvim_set_keymap("n", "<C-,>", ":lua require('togglesemi').toggle(',')<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<C-;>", ":lua require('togglesemi').toggle(';')<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap(
    "i",
    "<C-,>",
    "<Esc>:lua require('togglesemi').toggle(',')<CR>a",
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    "i",
    "<C-;>",
    "<Esc>:lua require('togglesemi').toggle(';')<CR>a",
    { noremap = true, silent = true }
  )
end

return M
