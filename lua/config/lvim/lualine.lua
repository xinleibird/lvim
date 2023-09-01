-- Lualine separators style
lvim.builtin.lualine.options.section_separators = { left = "", right = "" }
lvim.builtin.lualine.options.component_separators = { left = "", right = "" }

local function selectionCount()
  local isVisualMode = vim.fn.mode():find "[Vv]"
  if not isVisualMode then
    return "%P  %04L"
  end
  local starts = vim.fn.line "v"
  local ends = vim.fn.line "."
  local lines = starts <= ends and ends - starts + 1 or starts - ends + 1
  return string.format("%03d", tostring(lines))
    .. " 󰫙 "
    .. string.format("%04d", tostring(vim.fn.wordcount().visual_chars))
end

lvim.builtin.lualine.sections.lualine_z = {
  { selectionCount },
}
