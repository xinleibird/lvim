-- Let treesitter use bash highlight for zsh files as well
vim.api.nvim_create_autocmd("FileType", {
  pattern = "zsh",
  callback = function()
    require("nvim-treesitter.highlight").attach(0, "bash")
  end,
})

vim.api.nvim_create_autocmd("QuitPre", {
  pattern = "*",
  callback = function()
    vim.cmd.cclose()
    vim.cmd.lclose()
    require("dapui").close() -- Close DAP first
    local tree_wins = {}
    local floating_wins = {}
    local wins = vim.api.nvim_list_wins()

    for _, w in ipairs(wins) do
      local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
      if bufname:match "NvimTree_" ~= nil or bufname:match "OUTLINE" ~= nil then
        table.insert(tree_wins, w)
      end
      if bufname:match "qf" ~= nil then
        require("symbols-outline").close_outline()
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

-- Basis columns set notify position
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local columns = vim.api.nvim_win_get_width(0)
    if columns < 83 then
      require("notify").setup {
        render = "default",
        timeout = 1000,
        stages = "static",
        top_down = false,
      }
    else
      require("notify").setup {
        render = "default",
        timeout = 1000,
        stages = "static",
        top_down = true,
      }
    end
  end,
})

-- Basis columns set notify position
vim.api.nvim_create_autocmd("VimResized", {
  callback = function()
    local columns = vim.api.nvim_win_get_width(0)
    if columns < 83 then
      require("notify").setup {
        render = "default",
        timeout = 1000,
        stages = "static",
        top_down = false,
      }
    else
      require("notify").setup {
        render = "default",
        timeout = 1000,
        stages = "static",
        top_down = true,
      }
    end
  end,
})
