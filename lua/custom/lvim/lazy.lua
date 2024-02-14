-- Close lazy buffer use <esc> and q
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "lazy" },
  group = vim.api.nvim_create_augroup("user_add_quit_hotkey", { clear = true }),
  -- command = "nnoremap <buffer><silent> <Esc> <CMD>close!<CR>|nnoremap <buffer><silent> q <CMD>close!<CR>",
  command = "nnoremap <buffer><silent> <Esc> <CMD>close!<CR>",
})
