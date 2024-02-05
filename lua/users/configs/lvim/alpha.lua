-- Enable dashboard
-- lvim.builtin.alpha.active = false

local function reset_logo_hls()
  local green = vim.g.terminal_color_2
  local blue = vim.g.terminal_color_4

  vim.api.nvim_set_hl(0, "NeovimDashboardLogo1", { fg = blue })
  vim.api.nvim_set_hl(0, "NeovimDashboardLogo2", { fg = green, bg = blue })
  vim.api.nvim_set_hl(0, "NeovimDashboardLogo3", { fg = green })
  vim.api.nvim_set_hl(0, "NeovimDashboardLogo4", { fg = green, bold = true })
end

local pacman =
  "󰮯············································󱙝󰊠󱙝"
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

-- lvim.builtin.alpha.dashboard.section.header.val = require("users.libs.banner").generate()
lvim.builtin.alpha.dashboard.section.header.val = {
  [[                 ]],
  [[                 ]],
  [[                 ]],
  [[     █  █     ]],
  [[     ██ ██     ]],
  [[     █████     ]],
  [[     ██ ███     ]],
  [[     █  █     ]],
  [[                 ]],
  [[                 ]],
  [[N  E  O   V  I  M]],
  [[                 ]],
  [[                 ]],
  [[                 ]],
}

lvim.builtin.alpha.dashboard.section.header.opts.hl = {
  { { "", 0, 0 } },
  { { "", 0, 0 } },
  { { "", 0, 0 } },
  { { "NeovimDashboardLogo1", 6, 8 }, { "NeovimDashboardLogo3", 9, 22 } },
  {
    { "NeovimDashboardLogo1", 6, 8 },
    { "NeovimDashboardLogo2", 9, 11 },
    { "NeovimDashboardLogo3", 12, 24 },
  },
  { { "NeovimDashboardLogo1", 6, 11 }, { "NeovimDashboardLogo3", 12, 26 } },
  { { "NeovimDashboardLogo1", 6, 11 }, { "NeovimDashboardLogo3", 12, 24 } },
  { { "NeovimDashboardLogo1", 6, 11 }, { "NeovimDashboardLogo3", 12, 22 } },
  { { "", 0, 0 } },
  { { "", 0, 0 } },
  { { "NeovimDashboardLogo3", 0, 8 }, { "NeovimDashboardLogo4", 9, 17 } },
}

lvim.builtin.alpha.dashboard.section.buttons.entries = {
  { "<Leader>sp", lvim.icons.ui.FindFile .. "  Find File", "<CMD>Telescope find_files<CR>" },
  { "<Leader>n ", lvim.icons.ui.NewFile .. "  New File", "<CMD>ene!<CR>" },
  { "<Leader>sP", lvim.icons.ui.Project .. "  Projects ", "<CMD>Telescope projects<CR>" },
  { "<Leader>sr", lvim.icons.ui.History .. "  Recent files", ":Telescope oldfiles <CR>" },
  { "<Leader>st", lvim.icons.ui.FindText .. "  Find Text", "<CMD>Telescope live_grep<CR>" },
  { "<Leader>q ", lvim.icons.ui.Close .. "  Quit", "<CMD>quit<CR>" },
}

lvim.builtin.alpha.dashboard.section.footer.val = require("lvim.interface.text").align_center(
  { width = 0 },
  { "", "", pacman, skills, version },
  0
)

vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("neovim_alpha", {}),
  callback = function()
    reset_logo_hls()
  end,
})
