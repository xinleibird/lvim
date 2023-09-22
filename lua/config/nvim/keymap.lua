-- Remap gh gH to disable <Select Mode>
-- lvim.lsp.buffer_mappings.normal_mode['gh']   = { vim.lsp.buf.hover, "Show hover" }
-- lvim.lsp.buffer_mappings.normal_mode['gH']   = { vim.lsp.buf.hover, "Show hover" }

-- Paste hotkey in Insert Mode
vim.keymap.set(
  "i",
  "<D-v>",
  "<esc>:set paste<cr>a<c-r>=getreg('+')<cr><esc>:set nopaste<cr>mi`[=`]`ia",
  { noremap = true, silent = true }
)

-- Paste hotkey in Ex Mode
vim.keymap.set("c", "<D-v>", "<C-r>+", { noremap = true })

-- Command mode move cursor to line head
vim.keymap.set("c", "<C-a>", "<C-b>", { noremap = true })
