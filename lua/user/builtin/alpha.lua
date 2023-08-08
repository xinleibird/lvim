-- Enable dashboard
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"

-- Custom dashboard banner
lvim.builtin.alpha.dashboard.section.header.val = require("user.plugin.banner").dashboard()
lvim.builtin.alpha.dashboard.section.footer.val = require("lvim.interface.text").align_center(
  { width = 0 },
  { "", "", "", "PRESS START", "LunarVim" },
  0.5
)
lvim.builtin.alpha.dashboard.opts.autostart = false
