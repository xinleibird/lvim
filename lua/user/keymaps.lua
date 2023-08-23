-- Remap gh gH to disable <Select Mode>
-- lvim.lsp.buffer_mappings.normal_mode['gh']   = { vim.lsp.buf.hover, "Show hover" }
-- lvim.lsp.buffer_mappings.normal_mode['gH']   = { vim.lsp.buf.hover, "Show hover" }

-- Add new Map to <f2>
-- lvim.lsp.buffer_mappings.normal_mode["<f2>"] = { vim.lsp.buf.rename, "Rename all references" }

-- Paste hotkey
vim.api.nvim_set_keymap("i", "<D-v>", "<C-o>:set paste<CR><C-r>+<C-o>:set nopaste<CR>", { noremap = true })
vim.api.nvim_set_keymap("c", "<D-v>", "<C-r>+", { noremap = true })

-- Toggle terminal mapping
lvim.builtin.terminal.open_mapping = "<c-`>"

-- Command mode move cursor to line head
vim.api.nvim_set_keymap("c", "<C-a>", "<C-b>", { noremap = true })

-- Toggle end of line semi and coma
vim.api.nvim_set_keymap(
  "n",
  "<C-,>",
  ":lua require('user.plugin.togglesemi').toggle(',')<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<C-;>",
  ":lua require('user.plugin.togglesemi').toggle(';')<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "i",
  "<C-,>",
  "<Esc>:lua require('user.plugin.togglesemi').toggle(',')<CR>a",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "i",
  "<C-;>",
  "<Esc>:lua require('user.plugin.togglesemi').toggle(';')<CR>a",
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap("n", "<F2>", '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<F2>", '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<F2>", '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
