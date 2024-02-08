-- Remap gh gH to disable <Select Mode>
-- lvim.lsp.buffer_mappings.normal_mode['gh']   = { vim.lsp.buf.hover, "Show hover" }
-- lvim.lsp.buffer_mappings.normal_mode['gH']   = { vim.lsp.buf.hover, "Show hover" }

-- Paste hotkey in Insert Mode

local OS = vim.loop.os_uname().sysname
if OS == "Darwin" then
  vim.keymap.set(
    "i",
    "<D-v>",
    "<esc>:set paste<cr>a<c-r>=getreg('+')<cr><esc>:set nopaste<cr>mi`[=`]`ia",
    { noremap = true, silent = true, desc = "Command+v to paste in insert mode" }
  )
  -- Paste hotkey in Cmd Mode
  vim.keymap.set("c", "<D-v>", "<C-r>+", { noremap = true, desc = "Command+v to paste in Cmd mode" })
else
  vim.keymap.set(
    "i",
    "<C-v>",
    "<esc>:set paste<cr>a<c-r>=getreg('+')<cr><esc>:set nopaste<cr>mi`[=`]`ia",
    { noremap = true, silent = true, desc = "Ctrl+v to paste in insert mode" }
  )
  -- Paste hotkey in Cmd Mode
  vim.keymap.set("c", "<C-v>", "<C-r>+", { noremap = true, desc = "Ctrl+v to paste in Cmd mode" })
end

-- Command mode move cursor to line head
vim.keymap.set("c", "<C-a>", "<C-b>", { noremap = true, desc = "Ctrl+a to head of line in Cmd mode(<c-b>)" })
