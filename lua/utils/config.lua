local M = {}

M.load = function(path)
  for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath "config" .. "/lua/config/" .. path, [[v:val =~ '\.lua$']])) do
    require("config." .. path .. "." .. file:gsub("%.lua$", ""))
  end
end

return M
