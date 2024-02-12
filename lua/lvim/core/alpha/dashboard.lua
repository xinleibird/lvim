local M = {}

function M.get_sections()
  local banner = {
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

  local header = {
    type = "text",
    val = banner,
    opts = {
      position = "center",
      hl = {
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
      },
    },
  }

  local text = require "lvim.interface.text"
  local pacman =
    "󰮯············································󱙝󰊠󱙝"
  local skills = "            󰟬  󱏿          󰎙      󰜫  󰘐"

  local full_version = " Neovim ver "
    .. vim.version().major
    .. "."
    .. vim.version().minor
    .. "."
    .. vim.version().patch
    .. "              "
    .. require("lvim.utils.git").get_lvim_branch()
    .. " LunarVim"
    .. " "

  local footer = {
    type = "text",
    val = text.align_center({ width = 0 }, { "", "", pacman, skills, full_version }, 0),
    opts = {
      position = "center",
      hl = "Number",
    },
  }

  local buttons = {
    opts = {
      hl = "Label",
      hl_shortcut = "Include",
      spacing = 1,
    },
    entries = {
      { "<Leader>sp", lvim.icons.ui.FindFile .. "  Find File", "<CMD>Telescope find_files<CR>" },
      { "<Leader> n", lvim.icons.ui.NewFile .. "  New File", "<CMD>ene!<CR>" },
      { "<Leader>sP", lvim.icons.ui.Project .. "  Projects ", "<CMD>Telescope projects<CR>" },
      { "<Leader>sr", lvim.icons.ui.History .. "  Recent files", ":Telescope oldfiles <CR>" },
      { "<Leader>st", lvim.icons.ui.FindText .. "  Find Text", "<CMD>Telescope live_grep<CR>" },
      { "<Leader> q", lvim.icons.ui.Close .. "  Quit", "<CMD>quit<CR>" },
    },
  }
  return {
    header = header,
    buttons = buttons,
    footer = footer,
  }
end

vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("neovim_alpha", {}),
  callback = function()
    local green = vim.g.terminal_color_2
    local blue = vim.g.terminal_color_4
    vim.api.nvim_set_hl(0, "NeovimDashboardLogo1", { fg = blue })
    vim.api.nvim_set_hl(0, "NeovimDashboardLogo2", { fg = green, bg = blue })
    vim.api.nvim_set_hl(0, "NeovimDashboardLogo3", { fg = green })
    vim.api.nvim_set_hl(0, "NeovimDashboardLogo4", { fg = green, bold = true })
  end,
})

return M
