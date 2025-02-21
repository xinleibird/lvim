-- Add Telescope ignore patterns
lvim.builtin.telescope.defaults.file_ignore_patterns = {
  "%.DS_Store",
  "%.git/",
  "^%.DS_Store",
  "^%.bash_history",
  "^%.cache/",
  "^%.cargo/",
  "^%.lemminx/",
  "^%.localized",
  "^%.npm/",
  "^%.nvm/",
  "^%.oh%-my%-zsh/",
  "^%.python_history",
  "^%.redhat",
  "^%.rustup",
  "^%.ssh/",
  "^%.viminfo",
  "^%.vscode-cli/",
  "^%.vscode/",
  "^%.zcompdump",
  "^%.zsh_sessions/",
  "^%Pictures/",
  "^Applications/",
  "^Documents/",
  "^Downloads/",
  "^Icon$",
  "^Library/",
  "^Movies/",
  "^Music/",
  "^node_modules/",
  "^Public/",
  "lock%.json",
}

-- Set <C-u>
lvim.builtin.telescope.defaults.mappings.i["<C-u>"] = false

-- Set q to close
local actions = require "telescope.actions"
lvim.builtin.telescope.defaults.mappings.n["q"] = actions.close

lvim.builtin.telescope.defaults.prompt_prefix = "󰊠 "
lvim.builtin.telescope.defaults.selection_caret = "󰮯 "
