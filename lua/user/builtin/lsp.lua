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
-- capabilities.textDocument.completion.completionItem.resolveSupport = {
--   properties = {
--     "documentation",
--     "detail",
--     "additionalTextEdits",
--   },
-- }


-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
-- local util = require 'lspconfig/util'

-- require("lvim.lsp.manager").setup("emmet_ls", {
--   default_config = {
--     cmd = { 'emmet-language-server', '--stdio' },
--     filetypes = {
--       'html', 'typescriptreact', 'javascriptreact', 'javascript',
--       'typescript', 'javascript.jsx', 'typescript.tsx', 'css'
--     },

--     root_dir = util.root_pattern("package.json", ".git"),
--     settings = {},
--   },
-- })

-- require("lvim.lsp.manager").setup("emmet_ls", { capabilities = capabilities, })


-- require("lvim.lsp.manager").setup("html", {
--   cmd = { "vscode-html-language-server", "--stdio" },
--   filetypes = { "html" },
--   init_options = {
--     html = {
--       options = {
--         configurationSection = { "html", "css", "javascript" },
--         embeddedLanguages = {
--           css = true,
--           javascript = true
--         },
--         provideFormatter = true
--       },
--     },
--   },
--   single_file_support = true
-- })

-- require('cmp').setup({
--   sources = {
--     { name = 'emmet' }
--   }
-- })
