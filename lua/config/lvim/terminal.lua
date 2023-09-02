-- Toggle terminal mapping
lvim.builtin.terminal.open_mapping = "<C-`>"
lvim.builtin.terminal.execs = {}

lvim.builtin.terminal.float_opts.width = function()
  return math.floor(vim.o.columns * 0.9)
end

lvim.builtin.terminal.float_opts.height = function()
  return math.floor(vim.o.lines * 0.8)
end
