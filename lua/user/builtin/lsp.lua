---Configure a server manually. IMPORTANT: Requires `:LvimCacheReset` to take effect
---see the full default list `:lua =lvim.lsp.automatic_configuration.skipped_servers`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local options = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", options)

-- You can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback                         = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

---Remove a server from the skipped list, e.g. eslint, or emmet_ls. IMPORTANT: Requires `:LvimCacheReset` to take effect
---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

require("lvim.lsp.manager").setup "emmet_language_server"
require("lvim.lsp.manager").setup "taplo"
require("lvim.lsp.manager").setup "vale-ls"
require("lvim.lsp.manager").setup "intelephense"
require("lvim.lsp.manager").setup("bashls", {
  cmd = { "bash-language-server", "start" },
  filetypes = { "sh", "bash", "zsh" },
})

require("lvim.lsp.manager").setup("tsserver", {
  on_attach = function(client, _)
    client.server_capabilities.documentFormattingProvider = false
  end,
})

require("lvim.lsp.manager").setup("lua_ls", {
  on_attach = function(client, _)
    client.server_capabilities.documentFormattingProvider = false
  end,
})

require("lvim.lsp.manager").setup("html", {
  on_attach = function(client, _)
    client.server_capabilities.documentFormattingProvider = false
  end,
})
--
-- if you want to set up formatting on save, you can use this as a callback
-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- local lsp_formatting = function(bufnr)
--   vim.lsp.buf.format {
--     filter = function(client)
--       -- apply whatever logic you want (in this example, we'll only use null-ls)
--       return client.name == "null-ls"
--     end,
--     bufnr = bufnr,
--   }
-- end

-- local on_attach = function(client, bufnr)
--   if client.supports_method "textDocument/formatting" then
--     vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
--     vim.api.nvim_create_autocmd("BufWritePre", {
--       group = augroup,
--       buffer = bufnr,
--       callback = function()
--         lsp_formatting(bufnr)
--       end,
--     })
--   end
-- end

-- require("lvim.lsp.manager").setup("tsserver", { on_attach = on_attach })
-- require("lvim.lsp.manager").setup("lua_ls", { on_attach = on_attach })
-- require("lvim.lsp.manager").setup("html", { on_attach = on_attach })
