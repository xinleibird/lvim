-- Remap gh gH to disable <Select Mode>
-- lvim.lsp.buffer_mappings.normal_mode['gh']   = { vim.lsp.buf.hover, "Show hover" }
-- lvim.lsp.buffer_mappings.normal_mode['gH']   = { vim.lsp.buf.hover, "Show hover" }

-- Paste hotkey
vim.keymap.set("i", "<D-v>", "<C-o>:set paste<CR><C-r>+<C-o>:set nopaste<CR>", { noremap = true })
vim.keymap.set("c", "<D-v>", "<C-r>+", { noremap = true })

-- Command mode move cursor to line head

vim.keymap.set("c", "<C-a>", "<C-b>", { noremap = true })
