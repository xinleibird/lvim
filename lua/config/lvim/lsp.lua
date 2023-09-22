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
lvim.lsp.buffer_mappings.normal_mode["gR"] = { vim.lsp.buf.rename, "Rename all references" }

lvim.lsp.buffer_mappings.normal_mode["gd"] = { "<cmd>Telescope lsp_definitions<cr>", "Goto definition" }
lvim.lsp.buffer_mappings.normal_mode["gD"] = { "<cmd>Telescope lsp_type_definitions<cr>", "Goto Declaration" }
lvim.lsp.buffer_mappings.normal_mode["gr"] = { "<cmd>Telescope lsp_references<cr>", "Goto references" }
lvim.lsp.buffer_mappings.normal_mode["gI"] = { "<cmd>Telescope lsp_implementations<cr>", "Goto Implementation" }

lvim.lsp.installer.setup.ensure_installed = {
  "angularls",
  "bashls",
  "cssls",
  "emmet_language_server",
  "gopls",
  "html",
  "intelephense",
  "jsonls",
  "lemminx",
  "lua_ls",
  "tailwindcss",
  "taplo",
  "tsserver",
  "vale_ls",
  "vimls",
  "volar",
  "yamlls",
}

require("lvim.lsp.manager").setup "angularls"
require("lvim.lsp.manager").setup "cssls"
require("lvim.lsp.manager").setup "emmet_language_server"
require("lvim.lsp.manager").setup "gopls"
require("lvim.lsp.manager").setup "html"
require("lvim.lsp.manager").setup "jsonls"
require("lvim.lsp.manager").setup "lemminx"
require("lvim.lsp.manager").setup "lua_ls"
require("lvim.lsp.manager").setup "tailwindcss"
require("lvim.lsp.manager").setup "taplo"
require("lvim.lsp.manager").setup "tsserver"
require("lvim.lsp.manager").setup "vale_ls"
require("lvim.lsp.manager").setup "vimls"
require("lvim.lsp.manager").setup "volar"
require("lvim.lsp.manager").setup "yamlls"

require("lvim.lsp.manager").setup("bashls", {
  cmd = { "bash-language-server", "start" },
  filetypes = { "sh", "bash", "zsh" },
})

require("lvim.lsp.manager").setup("intelephense", {
  init_options = {
    globalStoragePath = os.getenv "HOME" .. "/.intelephense",
  },
  -- on_attach = function(client, _)
  --   client.server_capabilities.documentFormattingProvider = false
  -- end,
})
