-- Set save without formatting
lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<CR>", "Save without formatting" }

-- Terminiate session
lvim.builtin.which_key.mappings.d.T = { "<cmd>DapTerminate<CR>", "Terminiate current Dap session" }

-- Switch sp sP
lvim.builtin.which_key.mappings.s.P = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings.s.p = { "<cmd>Telescope find_files<CR>", "Find Files" }

-- Switch sb sB
lvim.builtin.which_key.mappings.s.B = { "<cmd>Telescope git_branches<CR>", "Checkout branch" }
lvim.builtin.which_key.mappings.s.b = { "<cmd>Telescope scope buffers<CR>", "Show all buffers" }

-- Outline Toggle
lvim.builtin.which_key.mappings.o = { ":SymbolsOutline<CR>", "Outline" }

-- Show all notifies
lvim.builtin.which_key.mappings.s.n = { "<cmd>Telescope notify<CR>", "Show notifies" }
