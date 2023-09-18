local M = {
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    dependencies = {
      {
        "SmiteshP/nvim-navic",
        config = function()
          require("lvim.core.breadcrumbs").setup()
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
