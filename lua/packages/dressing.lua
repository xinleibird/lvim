return {
  "stevearc/dressing.nvim",
  priority = 1000,
  opts = {},
  config = function()
    vim.api.nvim_create_autocmd({ "FileType" }, {
      group = vim.api.nvim_create_augroup("user_dreesing_rename_group", { clear = true }),
      callback = function()
        if vim.bo.ft == "DressingInput" then
          for _, mode in ipairs { "n", "i", "v" } do
            vim.keymap.set(mode, "<C-a>", "<Home>", { remap = true, buffer = true, silent = true })
            vim.keymap.set(mode, "<C-e>", "<End>", { remap = true, buffer = true, silent = true })
            vim.keymap.set(mode, "<C-b>", "<Left>", { remap = true, buffer = true, silent = true })
            vim.keymap.set(mode, "<C-f>", "<right>", { remap = true, buffer = true, silent = true })
          end
        end
      end,
    })
  end,
}
