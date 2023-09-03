-- For $TM_SELECTED_TEXT, use **SELECT-MODE** and use snippets wrap selected contents
-- help:
--    h:v_CTRL-G
--    h:select-mode
--    h:v_gV
--    h:gh
--    h:gH
--    h:g_CTRL-H
--    h:v_CTRL-G
-- reference:
--    <https://github.com/L3MON4D3/LuaSnip/blob/a46ab6f8bce6bbddd8ce3e287e1a517c1f5e348e/DOC.md#variables>
local ok, luasnip = pcall(require, "luasnip")
if ok then
  luasnip.config.setup { store_selection_keys = "<Tab>" }
end
