-- Always show bufferline

lvim.builtin.bufferline.options.always_show_bufferline = true

lvim.builtin.bufferline.options.custom_areas = {
  left = function()
    local result = {}
    local ok, api = pcall(require, "nvim-tree.api")

    if ok then
      if api.tree.is_visible() then
        table.insert(result, { text = "  ", link = "@label" })
      else
        table.insert(result, { text = "  ", link = "@label" })
      end
    end
    return result
  end,
  right = function()
    local result = {}
    local ok, outline = pcall(require, "outline")

    if ok then
      if outline.is_open() then
        table.insert(result, { text = " ◨ ", link = "@label" })
      else
        table.insert(result, { text = " ◫ ", link = "@label" })
      end
    end
    return result
  end,
}

lvim.builtin.bufferline.options.offsets = {
  {
    filetype = "undotree",
    text = "Undotree",
    highlight = "PanelHeading",
    padding = 1,
  },
  {
    filetype = "NvimTree",
    text = "󱏒 Explorer",
    highlight = "PanelHeading",
    padding = 1,
  },
  {
    filetype = "DiffviewFiles",
    text = "Diff View",
    highlight = "PanelHeading",
    padding = 1,
  },
  {
    filetype = "flutterToolsOutline",
    text = "Flutter Outline",
    highlight = "PanelHeading",
  },
  {
    filetype = "lazy",
    text = "Lazy",
    highlight = "PanelHeading",
    padding = 1,
  },
}
