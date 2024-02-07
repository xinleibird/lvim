-- Set Project to manual_mode
lvim.builtin.project.manual_mode = true

-- Add .prettierrc to Project patterns
local custom_patterns = {
  ".prettierrc",
  ".prettierrc.*",
  "build",
  "go.mod",
  ".gitignore",
  "Cargo.toml",
  "Cargo.lock",
}

vim.list_extend(lvim.builtin.project.patterns, custom_patterns)
