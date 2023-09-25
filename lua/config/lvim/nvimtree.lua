-- NvimTree settings
-- lvim.builtin.nvimtree.setup.filters.dotfiles = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.nvimtree.setup.renderer.icons.git_placement = "after"
lvim.builtin.nvimtree.setup.renderer.icons.glyphs.git = {
  deleted = "󰅖",
  ignored = "󰛑",
  renamed = "󱞩",
  staged = "󰄬",
  unmerged = "󰃸",
  unstaged = "󰎂",
  untracked = "󰛐",
}

lvim.builtin.nvimtree.setup.git.ignore = true
lvim.builtin.nvimtree.setup.update_cwd = true
lvim.builtin.nvimtree.setup.sync_root_with_cwd = true
lvim.builtin.nvimtree.setup.respect_buf_cwd = false
lvim.builtin.nvimtree.setup.update_focused_file = {
  enable = false,
  update_root = false,
}
lvim.builtin.nvimtree.setup.filters.custom = {
  "^Icon[^M]",
  "^Network Trash Folder",
  "^Temporary Items",
  "^\\.AppleDB",
  "^\\.AppleDesktop",
  "^\\.AppleDouble",
  "^\\.CFUserTextEncoding",
  "^\\.DS_Store",
  "^\\.DocumentRevisions-V100",
  "^\\.Spotlight-V100",
  "^\\.TemporaryItems",
  "^\\.Trashes",
  "^\\.VolumeIcon.icns",
  "^\\.apdisk",
  "^\\.com.apple.timemachine.donotpresent",
  "^\\.fseventsd",
  "^\\.git",
  "^\\.vscode",
  "^node_modules",
}
