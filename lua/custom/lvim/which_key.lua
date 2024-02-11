-- Set save without formatting
lvim.builtin.which_key.mappings["W"] = { "<CMD>noautocmd w<CR>", "Save without formatting" }

-- Terminiate session
lvim.builtin.which_key.mappings.d.T = { "<CMD>DapTerminate<CR>", "Terminiate current Dap session" }

lvim.builtin.which_key.mappings.d.r = {
  function()
    require("dap").repl.toggle({ height = 7 }, "lefta split")
  end,
  "Toggle Repl",
}
-- Switch sp sP
lvim.builtin.which_key.mappings.s.P = { "<CMD>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings.s.p = { "<CMD>Telescope find_files<CR>", "Find Files" }

-- Switch sb sB
lvim.builtin.which_key.mappings.s.B = { "<CMD>Telescope git_branches<CR>", "Checkout branch" }
lvim.builtin.which_key.mappings.s.b = { "<CMD>Telescope scope buffers<CR>", "Show all buffers" }

-- Disable builtin lazygit keymap
lvim.builtin.which_key.mappings.g.g = nil

-- Lsp show References
lvim.builtin.which_key.mappings.l.r = {
  function()
    require("telescope.builtin").lsp_references()
  end,
  "Show References",
}

-- Lsp rename
lvim.builtin.which_key.mappings.l.R = {
  function()
    vim.lsp.buf.rename()
  end,
  "Rename all references",
}

-- Close all other buffers
lvim.builtin.which_key.mappings.b.W = { "<CMD>BufferLineCloseOthers<CR>", "Close all other buffers" }
