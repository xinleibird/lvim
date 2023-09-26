vim.api.nvim_create_user_command("GitLazy", function()
  require("gitlazy").open()
end, { nargs = "*", desc = "Open LazyGit with toggleterm" })
