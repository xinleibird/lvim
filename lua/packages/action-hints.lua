return {
  "roobert/action-hints.nvim",
  config = function()
    require("action-hints").setup {
      template = {
        definition = { text = " 󰮯", color = "#ff6666" },
        references = { text = " 󰊠×%s", color = "#66ffff" },
      },
      use_virtual_text = true,
    }
  end,
}
