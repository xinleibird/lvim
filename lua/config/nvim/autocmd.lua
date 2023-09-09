-- Let treesitter use bash highlight for zsh files as well
vim.api.nvim_create_autocmd("FileType", {
  pattern = "zsh",
  callback = function()
    local ok, highlight = pcall(require, "nvim-treesitter.highlight")
    if ok then
      highlight.attach(0, "bash")
    end
  end,
})

vim.api.nvim_create_autocmd("QuitPre", {
  callback = function()
    require("dapui").close()

    vim.cmd.cclose()
    vim.cmd.lclose()
    local tree_wins = {}
    local floating_wins = {}
    local wins = vim.api.nvim_list_wins()

    for _, w in ipairs(wins) do
      local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
      if bufname:match "NvimTree_" ~= nil or bufname:match "OUTLINE" ~= nil then
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
