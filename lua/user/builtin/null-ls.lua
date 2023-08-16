-- Formatters
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    command = "stylua",
    condition = function(utils)
      return utils.root_has_file { "stylua.toml", ".stylua.toml" }
    end,
  },
  {
    name = "prettier",
    condition = function(utils)
      return utils.root_has_file {
        ".prettierrc",
        ".prettierrc.json",
        ".prettierrc.yml",
        ".prettierrc.yaml",
        ".prettierrc.json5",
        ".prettierrc.js",
        "prettier.config.js",
        ".prettierrc.mjs",
        "prettier.config.mjs",
        ".prettierrc.cjs",
        "prettier.config.cjs",
        ".prettierrc.toml",
      }
    end,
  },
}

-- Linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "jsonlint", filetypes = { "json" } },
  { command = "shellcheck", args = { "--severity", "warning" } },
  {
    command = "eslint",
    filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
    condition = function(utils)
      return utils.root_has_file {
        "eslint.config.js",
        ".eslintrc.js",
        ".eslintrc.cjs",
        ".eslintrc.yml",
        ".eslintrc.yaml",
        ".eslintrc.json",
      }
    end,
  },
}
