-- Enable dashboard
-- lvim.builtin.alpha.active = false

local pacman =
  "󰮯············································󱙝󰊠󱙝"
-- local greeting = require("utils.greeting").generate()
local skills = "            󰟬  󱏿          󰎙      󰜫  󰘐"

local lvim_version = require("lvim.utils.git").get_lvim_branch()

local version = " Neovim ver "
  .. vim.version().major
  .. "."
  .. vim.version().minor
  .. "."
  .. vim.version().patch
  .. "              "
  .. lvim_version
  .. " LunarVim"
  .. " "

lvim.builtin.alpha.dashboard.section.header.val = require("utils.banner").dashboard()
lvim.builtin.alpha.dashboard.section.footer.val = require("lvim.interface.text").align_center(
  { width = 0 },
  { "", "", pacman, skills, version },
  0
)
