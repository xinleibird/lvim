local M = {
  {
    "terrortylor/nvim-comment",
    enabled = not lvim.builtin.comment.active,
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
      lvim.builtin.which_key.mappings["/"] = { "<CMD>CommentToggle<CR>", "Comment Toggle" }
      lvim.builtin.which_key.vmappings["/"] = { "<CMD>CommentToggle<CR>", "Comment Toggle (visual)" }
      require("ts_context_commentstring").setup {
        enable_autocmd = false,
      }
      require("nvim_comment").setup {
        comment_empty = false,
        hook = function()
          require("ts_context_commentstring").update_commentstring()
        end,
      }
    end,
  },
}

return M
