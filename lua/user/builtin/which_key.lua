-- Add leader key batch
lvim.builtin.which_key.mappings["W"]  = { "<cmd>noautocmd w<cr>", "Save without formatting" }
lvim.builtin.which_key.mappings["dT"] = { "<cmd>DapTerminate<cr>", "Terminiate current Dap session" }


-- Remap sp sP switch
lvim.builtin.which_key.mappings.s.P = {
  "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>", "Colorscheme with Preview" }
lvim.builtin.which_key.mappings.s.p = { "<cmd>Telescope projects<cr>", "Projects" }


lvim.builtin.which_key.mappings.s.B = { "<cmd>Telescope git_branches<cr>", "Checkout branch" }
lvim.builtin.which_key.mappings.s.b = { "<cmd>Telescope scope buffers<cr>", "Show all buffers" }


-- Set default Yank to use unnamed clipboard.(like vim original)
lvim.builtin.which_key.mappings.y  = { '"+y', "Yank to clipboard" }
lvim.builtin.which_key.mappings.P  = { '"+P', "Paste from clipboard" }
lvim.builtin.which_key.mappings.y  = { y = { '"+yy', "Yank line to clipboard" } }
lvim.builtin.which_key.vmappings.y = { '"+y', "Yank to clipboard" }
lvim.builtin.which_key.vmappings.p = { '"+p', "Paste from clipboard" }
