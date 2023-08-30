-- Enable dashboard
-- lvim.builtin.alpha.active = false

local greeting = require("local.utils.greeting").generate()
local version = "            󰟬  󱏿          󰎙      󰜫  󰘐"

lvim.builtin.alpha.dashboard.section.header.val = require("local.utils.banner").dashboard()
lvim.builtin.alpha.dashboard.section.footer.val = require("lvim.interface.text").align_center(
  { width = 0 },
  { "", "", "", greeting, version },
  0
)
