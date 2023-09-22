local M = {
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    dependencies = {
      {
        "SmiteshP/nvim-navic",
        config = function()
          require("lvim.core.breadcrumbs").setup()
          require("nvim-navic").setup {
            highlight = true,
          }
        end,
        event = "User FileOpened",
        enabled = not lvim.builtin.breadcrumbs.active,
      },
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {},
  },
}

return M
