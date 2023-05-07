-- Set Project to manual_mode
lvim.builtin.project.manual_mode = true

local added = { ".prettierrc", ".prettierrc.*" }
for _, v in pairs(added) do
  table.insert(lvim.builtin.project.patterns, v)
end
