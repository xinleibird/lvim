-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true
lvim.builtin.treesitter.ignore_install = { "haskell" }

-- Always installed on startup, useful for parsers without a strict filetype
lvim.builtin.treesitter.ensure_installed =
  { "comment", "markdown", "markdown_inline", "regex", "bash", "lua", "vim" }

-- Deprecated context_commentstring
lvim.builtin.treesitter.context_commentstring = nil
