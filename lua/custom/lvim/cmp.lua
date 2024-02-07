-- Autocomplete cmp menu settings
lvim.builtin.cmp.completion.completeopt = "menu,menuone"
lvim.builtin.cmp.completion.keyword_length = 1

-- Init cmp-emmet
lvim.builtin.cmp.formatting.source_names = {
  buffer = "  Buf",
  calc = " 󰪚 Cal",
  cmp_tabnine = " 󰲰 Tab",
  copilot = "  Cop",
  emoji = " 󰇷 Emo",
  luasnip = " 󱙷 Sni",
  nvim_lsp = " 󰅭 Lsp",
  path = "  Dir",
  tmux = " 󰐯 Tmu",
  treesitter = " 󰺔 Tre",
  vsnip = " 󱙷 Sni",
  nvim_lsp_signature_help = " 󰯉 Sig",
  ["sass-variables"] = " 󰟬 Sas",
}

-- Cmp format method
lvim.builtin.cmp.formatting.format = function(entry, vim_item)
  vim_item.menu = lvim.builtin.cmp.formatting.source_names[entry.source.name]

  local max_width = lvim.builtin.cmp.formatting.max_width
  if max_width ~= 0 and #vim_item.abbr > max_width then
    vim_item.abbr = string.sub(vim_item.abbr, 1, max_width - 1) .. lvim.icons.ui.Ellipsis
  end

  if lvim.use_icons then
    vim_item.kind = lvim.builtin.cmp.formatting.kind_icons[vim_item.kind]

    if entry.source.name == "copilot" then
      vim_item.kind = lvim.icons.git.Octoface
      vim_item.kind_hl_group = "CmpItemKindCopilot"
    end

    if entry.source.name == "cmp_tabnine" then
      vim_item.kind = lvim.icons.misc.Robot
      vim_item.kind_hl_group = "CmpItemKindTabnine"
    end

    if entry.source.name == "crates" then
      vim_item.kind = lvim.icons.misc.Package
      vim_item.kind_hl_group = "CmpItemKindCrate"
    end

    if entry.source.name == "lab.quick_data" then
      vim_item.kind = lvim.icons.misc.CircuitBoard
      vim_item.kind_hl_group = "CmpItemKindConstant"
    end

    if entry.source.name == "emoji" then
      vim_item.kind = lvim.icons.misc.Smiley
      vim_item.kind_hl_group = "CmpItemKindEmoji"
    end

    if entry.source.name == "nvim_lsp_signature_help" then
      vim_item.kind = lvim.icons.kind.Signature
      vim_item.kind_hl_group = "CmpItemKindTabnine"
    end

    if entry.source.name == "sass-variables" then
      vim_item.kind = lvim.icons.kind.Variable
      vim_item.kind_hl_group = "CmpItemKindVariable"
    end

    if entry.source.name == "nvim_lsp" then
      local debug_name = entry.source:get_debug_name()

      if debug_name == "nvim_lsp:emmet_language_server" then
        vim_item.kind = ""
        vim_item.menu = " 󱢍 EMM"
      end

      if debug_name == "nvim_lsp:tsserver" then
        vim_item.menu = "  TSS"
      end

      if debug_name == "nvim_lsp:html" then
        vim_item.menu = "  HTM"
      end

      if debug_name == "nvim_lsp:cssls" then
        vim_item.menu = "  CSS"
      end

      if debug_name == "nvim_lsp:lua_ls" then
        vim_item.menu = "  LUA"
      end

      if debug_name == "nvim_lsp:intelephense" then
        vim_item.menu = "  PHP"
      end

      if debug_name == "nvim_lsp:vimls" then
        vim_item.menu = "  VIM"
      end

      if debug_name == "nvim_lsp:rust_analyzer" then
        vim_item.menu = " 󱘗 RUS"
      end

      if debug_name == "nvim_lsp:gopls" then
        vim_item.menu = "   GO"
      end

      if debug_name == "nvim_lsp:null-ls" then
        vim_item.menu = " 󰬕 NUL"
      end
    end
  end

  vim_item.dup = lvim.builtin.cmp.formatting.duplicates[entry.source.name]
    or lvim.builtin.cmp.formatting.duplicates_default

  return vim_item
end
