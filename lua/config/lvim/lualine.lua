-- Lualine separators style
lvim.builtin.lualine.options.theme = "catppuccin"
lvim.builtin.lualine.options.section_separators = { left = "", right = "" }
lvim.builtin.lualine.options.component_separators = { left = "", right = "" }

local function isNormalMode()
  local mode = vim.fn.mode()
  return mode == "n" or mode == "niI" or mode == "niR" or mode == "niV" or mode == "nt" or mode == "ntT"
end

local function isVisualMode()
  local mode = vim.fn.mode()
  return mode == "V" or mode == "v" or mode == "CTRL-V" or mode == "\22"
end

local function selectionCount()
  local isVisual = isVisualMode()
  if isVisual then
    local starts = vim.fn.line "v"
    local ends = vim.fn.line "."
    local lines = starts <= ends and ends - starts + 1 or starts - ends + 1
    return string.format("%03d", tostring(lines))
      .. " 󰼂 "
      .. string.format("%04d", tostring(vim.fn.wordcount().visual_chars))
  end

  return "%P 󰼁 %04L"
end

lvim.builtin.lualine.sections.lualine_a = {
  {
    "mode",
    fmt = function()
      local isNormal = isNormalMode()
      if not isNormal then
        return "󱙝"
      end
      return "󰊠"
    end,
    separator = { left = " ", right = "" },
    padding = { left = 0, right = 0 },
  },
}

lvim.builtin.lualine.sections.lualine_z = {
  {
    selectionCount,
    separator = { left = "", right = " " },
    padding = { left = 1, right = 1 },
  },
}
