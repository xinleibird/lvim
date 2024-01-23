local M = {
  {
    "terrortylor/nvim-comment",
    config = function()
      lvim.builtin.which_key.mappings["/"] = { "<CMD>CommentToggle<CR>", "Comment Toggle" }
      lvim.builtin.which_key.vmappings["/"] = { "<CMD>CommentToggle<CR>", "Comment Toggle (visual)" }
      require("nvim_comment").setup {
        comment_empty = false,
        hook = function()
          require("ts_context_commentstring.internal").update_commentstring()
          -- if vim.api.nvim_buf_get_option(0, "filetype") == "vue" then
          --   require("ts_context_commentstring.internal").update_commentstring()
          -- end
        end,
      }
    end,
  },
}

return M
