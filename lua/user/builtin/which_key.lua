-- add leader key batch
lvim.builtin.which_key.mappings["W"]  = { "<cmd>noautocmd w<cr>", "Save without formatting" }
lvim.builtin.which_key.mappings["dT"] = { "<cmd>DapTerminate<cr>", "Terminiate current Dap session" }

-- sp sP switch
lvim.builtin.which_key.mappings.s.P   = { "<cmd>Telescope projects<cr>", "Projects" }
lvim.builtin.which_key.mappings.s.p   = { "<cmd>Telescope find_files<cr>", "Find Files" }

-- "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>", "Colorscheme with Preview" }

-- sb sB switch
lvim.builtin.which_key.mappings.s.B   = { "<cmd>Telescope git_branches<cr>", "Checkout branch" }
lvim.builtin.which_key.mappings.s.b   = { "<cmd>Telescope scope buffers<cr>", "Show all buffers" }


-- set outline hotkey
lvim.builtin.which_key.mappings.o = { ":SymbolsOutline<CR>", "Outline" }
