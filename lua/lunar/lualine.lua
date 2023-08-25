-- Lualine separators style
lvim.builtin.lualine.options.section_separators = { left = "", right = "" }
lvim.builtin.lualine.options.component_separators = { left = "", right = "" }

local function selectionCount()
  local isVisualMode = vim.fn.mode():find "[Vv]"
  if not isVisualMode then
    return "%P │ %L"
  end
  local starts = vim.fn.line "v"
  local ends = vim.fn.line "."
  local lines = starts <= ends and ends - starts + 1 or starts - ends + 1
  return "󰫙  " .. "󱥖 " .. tostring(lines) .. "  󰾹 " .. tostring(vim.fn.wordcount().visual_chars)
end

lvim.builtin.lualine.sections.lualine_z = {
  { selectionCount },
}
