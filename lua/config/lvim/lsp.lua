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

-- Add new Map to <f2>
lvim.lsp.buffer_mappings.normal_mode["<f2>"] = { vim.lsp.buf.rename, "Rename all references" }
lvim.lsp.buffer_mappings.insert_mode["<f2>"] = { vim.lsp.buf.rename, "Rename all references" }

lvim.lsp.installer.setup.ensure_installed = {
  "bashls",
  "cssls",
  "emmet_language_server",
  "gopls",
  "html",
  "intelephense",
  "jsonls",
  "lua_ls",
  "taplo",
  "tsserver",
  "vimls",
}

require("lvim.lsp.manager").setup "cssls"
require("lvim.lsp.manager").setup "emmet_language_server"
require("lvim.lsp.manager").setup "gopls"
require("lvim.lsp.manager").setup "jsonls"
require("lvim.lsp.manager").setup "taplo"
require("lvim.lsp.manager").setup "vale-ls"
require("lvim.lsp.manager").setup "vimls"

require("lvim.lsp.manager").setup("bashls", {
  cmd = { "bash-language-server", "start" },
  filetypes = { "sh", "bash", "zsh" },
})

require("lvim.lsp.manager").setup("html", {
  on_attach = function(client, _)
    client.server_capabilities.documentFormattingProvider = false
  end,
})

require("lvim.lsp.manager").setup("intelephense", {
  init_options = {
    globalStoragePath = os.getenv "HOME" .. "/.intelephense",
  },
})

require("lvim.lsp.manager").setup("lua_ls", {
  on_attach = function(client, _)
    client.server_capabilities.documentFormattingProvider = false
  end,
})

require("lvim.lsp.manager").setup("tsserver", {
  on_attach = function(client, _)
    client.server_capabilities.documentFormattingProvider = false
  end,
})
