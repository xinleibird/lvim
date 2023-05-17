-- Set Project to manual_mode
lvim.builtin.project.manual_mode = true

-- Add .prettierrc to Project patterns
local added = { ".prettierrc", ".prettierrc.*", "build" }
for _, v in pairs(added) do
  table.insert(lvim.builtin.project.patterns, v)
end
