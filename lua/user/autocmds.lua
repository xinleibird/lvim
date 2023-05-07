-- Restore last cursor position on file reopen
vim.api.nvim_create_autocmd("BufRead", {
  callback = function(ops)
    vim.api.nvim_create_autocmd('BufWinEnter', {
      once = true,
      buffer = ops.buf,
      callback = function()
        local ft = vim.bo[ops.buf].filetype
        local last_known_line = vim.api.nvim_buf_get_mark(ops.buf, '"')[1]
        if
            not (ft:match('commit') and ft:match('rebase'))
            and last_known_line > 1
            and last_known_line <= vim.api.nvim_buf_line_count(ops.buf)
        then
          vim.api.nvim_feedkeys([[g`"]], 'x', false)
        end
      end,
    })
  end,
})

-- Create autocmd (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
-- let treesitter use bash highlight for zsh files as well
vim.api.nvim_create_autocmd("FileType", {
  pattern = "zsh",
  callback = function()
    require("nvim-treesitter.highlight").attach(0, "bash")
  end,
})

-- AutoQuite nvim-tree and symbols-outline
vim.api.nvim_create_autocmd("QuitPre", {
  callback = function()
    local invalid_win = {}
    local wins = vim.api.nvim_list_wins()
    for _, w in ipairs(wins) do
      local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
      if bufname:match("NvimTree_") ~= nil or bufname:match("OUTLINE") ~= nil then
        table.insert(invalid_win, w)
      end
    end
    if #invalid_win == #wins - 1 then
      -- Should quit, so we close all invalid windows.
      for _, w in ipairs(invalid_win) do vim.api.nvim_win_close(w, true) end
    end
  end
})

-- Run vim original autocmd
lvim.autocommands = {
  -- leave lvim restore cursor style
  {
    "VimLeave",
    {
      pattern = "*",
      command = "set guicursor= | call chansend(v:stderr, \"\x1b[ q\")"
    }
  },
}
