-- remap gh gH to disable <Select Mode>
-- lvim.lsp.buffer_mappings.normal_mode['gh']   = { vim.lsp.buf.hover, "Show hover" }
-- lvim.lsp.buffer_mappings.normal_mode['gH']   = { vim.lsp.buf.hover, "Show hover" }

-- add new Map to <f2>
lvim.lsp.buffer_mappings.normal_mode['<f2>'] = { vim.lsp.buf.rename, "Rename all references" }

-- find files like ctrl+p
lvim.keys.normal_mode["<D-p>"]               = ":Telescope find_files<CR>"
lvim.keys.normal_mode["<D-o>"]               = ":SymbolsOutline<CR>"

-- paste hotkey
lvim.keys.insert_mode["<D-v>"]               = '<C-o>"+P'

-- toggle terminal mapping
lvim.builtin.terminal.open_mapping           = "<c-`>"
vim.api.nvim_set_keymap('c', '<D-v>', '<C-r>+', { noremap = true })

-- command mode move cursor to line head
vim.api.nvim_set_keymap('c', '<C-a>', '<C-b>', { noremap = true })
