-- Remap gh gH to disable <Select Mode>
-- lvim.lsp.buffer_mappings.normal_mode['gh']   = { vim.lsp.buf.hover, "Show hover" }
-- lvim.lsp.buffer_mappings.normal_mode['gH']   = { vim.lsp.buf.hover, "Show hover" }

-- Paste hotkey
vim.api.nvim_set_keymap("i", "<D-v>", "<C-o>:set paste<CR><C-r>+<C-o>:set nopaste<CR>", { noremap = true })
vim.api.nvim_set_keymap("c", "<D-v>", "<C-r>+", { noremap = true })

-- Command mode move cursor to line head
-- vim.api.nvim_set_keymap("c", "<C-a>", "<C-b>", { noremap = true, silent = true })

-- Toggle Buffer Quickfix
vim.api.nvim_set_keymap("n", "<C-q>", ":lua vim.diagnostic.setloclist()<CR>", { noremap = true, silent = true })
