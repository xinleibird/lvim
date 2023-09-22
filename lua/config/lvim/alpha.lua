-- Enable dashboard
-- lvim.builtin.alpha.active = false

local pacman =
  "󰮯············································󱙝󰊠󱙝"
local greeting = require("utils.greeting").generate()
local version = "            󰟬  󱏿          󰎙      󰜫  󰘐"

lvim.builtin.alpha.dashboard.section.header.val = require("utils.banner").dashboard()
lvim.builtin.alpha.dashboard.section.footer.val = require("lvim.interface.text").align_center(
  { width = 0 },
  { "", "", pacman, greeting, version },
  0
)
