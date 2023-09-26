-- Format on save
lvim.format_on_save.enabled = true
lvim.format_on_save.timeout = 500

lvim.format_on_save.pattern = {
  "*.{css,scss,sass}",
  "*.{Dockerfile,dockerfile}",
  "*.{go}",
  "*.{htm,html,xml}",
  "*.{js,jsx,ts,tsx,ejs,vue}",
  "*.{json,yaml,yml,toml,{.,}prettierrc,{.,}eslintrc,{.,}stylelintrc}",
  "*.{lua}",
  "*.{md,markdown}",
  "*.{php}",
  "*.{rs}",
  "*.{sh,bash,zsh}",
}

lvim.lsp.null_ls.setup.ensure_installed = {
  "goimports",
  "jsonlint",
  "prettier",
  "shellcheck",
  "shfmt",
  "stylua",
}

-- Formatters
require("lvim.lsp.null-ls.formatters").setup {
  { name = "goimports" },
  { name = "prettier" },
  {
    name = "shfmt",
    filetypes = { "sh", "bash", "zsh" },
  },
  { name = "stylua" },
}

-- Linters
require("lvim.lsp.null-ls.linters").setup {
  -- { name = "eslint" },
  { name = "jsonlint" },
  { name = "shellcheck", args = { "--severity", "warning" } },
}

-- Actions e.g. fix issues
require("lvim.lsp.null-ls.code_actions").setup {
  -- { name = "eslint" },
  { name = "shellcheck" },
}
