-- Enable dashboard
-- lvim.builtin.alpha.active = false

local version = "         "

local greeting = require("user.plugin.greeting").generate "xinlei"

lvim.builtin.alpha.dashboard.section.header.val = require("user.plugin.banner").dashboard()
lvim.builtin.alpha.dashboard.section.footer.val = require("lvim.interface.text").align_center(
  { width = 0 },
  { "", "", "", greeting, version },
  0.8
)
