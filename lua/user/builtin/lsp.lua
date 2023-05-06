-- Formatters
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup {
  -- { name = "black" },
  -- { command = "stylua" },
  { name = "prettier", },
  { name = "fixjson",  filetypes = { "json" } },
}

-- Linters
local linters = require("lvim.lsp.null-ls.linters")
linters.setup {
  { command = "jsonlint",   filetypes = { "json" } },
  { command = "eslint",     filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" } },
  { command = "shellcheck", args = { "--severity", "warning" }, },
  {
    command = "vint",
    args = { "--style-problem", "--json" },
    filetypes = { "vim" },
  },
}


---configure a server manually. IMPORTANT: Requires `:LvimCacheReset` to take effect
---see the full default list `:lua =lvim.lsp.automatic_configuration.skipped_servers`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local options = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", options)


-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback                         = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end
--
--
---remove a server from the skipped list, e.g. eslint, or emmet_ls. IMPORTANT: Requires `:LvimCacheReset` to take effect
---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- local lspconfig = require('lspconfig')
-- -- local configs = require('lspconfig/configs')
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true

-- require("lvim.lsp.manager").setup("emmet_ls", {
--   -- on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug",
--     "typescriptreact", "vue" },
--   init_options = {
--     html = {
--       options = {
--         -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
--         ["bem.enabled"] = true,
--       },
--     },
--   }
-- })
