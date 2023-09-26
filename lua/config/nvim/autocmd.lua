-- Let treesitter use bash highlight for zsh files as well
vim.api.nvim_create_autocmd("FileType", {
  pattern = "zsh",
  group = vim.api.nvim_create_augroup("user_zsh_highlight", { clear = true }),
  callback = function()
    local ok, highlight = pcall(require, "nvim-treesitter.highlight")
    if ok then
      highlight.attach(0, "bash")
    end
  end,
})

vim.api.nvim_create_autocmd("QuitPre", {
  group = vim.api.nvim_create_augroup("user_quit_before_close_windows", { clear = true }),
  callback = function()
    require("dap").repl.close()
    require("dapui").close()
    require("aerial").close_all()

    vim.cmd.cclose()
    vim.cmd.lclose()
    local tree_wins = {}
    local floating_wins = {}
    local wins = vim.api.nvim_list_wins()

    for _, w in ipairs(wins) do
      local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
      if bufname:match "NvimTree_" ~= nil then
        table.insert(tree_wins, w)
      end

      if vim.api.nvim_win_get_config(w).relative ~= "" then
        table.insert(floating_wins, w)
      end
    end

    if 1 == #wins - #floating_wins - #tree_wins then
      -- Should quit, so we close all invalid windows.
      for _, w in ipairs(tree_wins) do
        vim.api.nvim_win_close(w, true)
      end
    end
  end,
})

-- Leave lvim restore cursor style
vim.api.nvim_create_autocmd("VimLeave", {
  pattern = "*",
  command = 'set guicursor= | call chansend(v:stderr, "\x1b[ q")',
})

-- Close buffer use <esc> and q
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "dap-repl", "lazy", "NvimTree", "Trouble" },
  group = vim.api.nvim_create_augroup("user_add_quit_hotkey", { clear = true }),
  command = "nnoremap <buffer><silent> <Esc> <CMD>close!<CR>|nnoremap <buffer><silent> q <CMD>close!<CR>",
})

-- Fixed qf win height
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "dap-repl", "qf" },
  group = vim.api.nvim_create_augroup("user_set_qf_repl_window", { clear = true }),
  command = "setlocal winfixheight|setlocal nonumber",
})
