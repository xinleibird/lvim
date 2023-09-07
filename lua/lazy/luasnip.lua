local M = {
  {
    "L3MON4D3/LuaSnip",
    config = function()
      local utils = require "lvim.utils"
      local paths = {}
      local user_snippets = utils.join_paths(get_config_dir(), "snippets")
      if utils.is_directory(user_snippets) then
        paths[#paths + 1] = user_snippets
      end
      require("luasnip.loaders.from_lua").lazy_load()
      require("luasnip.loaders.from_vscode").lazy_load {
        paths = paths,
        exclude = { "all" },
      }
      require("luasnip.loaders.from_snipmate").lazy_load()
    end,
    event = "InsertEnter",
  },

  { "rafamadriz/friendly-snippets", lazy = true, dependencies = "L3MON4D3/LuaSnip" },
}

return M
