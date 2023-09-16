local M = {
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      -- configurations go here
    },
  },
  {
    "SmiteshP/nvim-navic",
    config = function()
      require("lvim.core.breadcrumbs").setup()
    end,
    event = "User FileOpened",
    enabled = not lvim.builtin.breadcrumbs.active,
  },
}

return M
