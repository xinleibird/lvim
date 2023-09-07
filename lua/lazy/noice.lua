local M = {
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      {
        "rcarriga/nvim-notify",
        config = function()
          lvim.builtin.which_key.mappings.s.n =
            { "<CMD>lua require('telescope').extensions.notify.notify()<CR>", "Open Notifies" }
        end,
        dependencies = {
          "nvim-telescope/telescope.nvim",
          priority = 500,
        },
      },
    },
    config = function()
      -- Basis columns set notify position
      vim.api.nvim_create_autocmd({ "VimEnter", "VimResized" }, {
        callback = function()
          local columns = vim.o.columns
          if columns < 83 then
            require("notify").setup {
              render = "default",
              timeout = 1000,
              stages = "static",
              top_down = false,
            }
          else
            require("notify").setup {
              render = "default",
              timeout = 1000,
              stages = "static",
              top_down = true,
            }
          end
        end,
      })

      require("noice").setup {
        -- routes = {
        --   {
        --     filter = { event = "msg_show", kind = "search_count" },
        --     opts = { skip = true },
        --     -- view = "mini",
        --   },
        --   {
        --     filter = {
        --       event = "msg_show",
        --       any = {
        --         { find = "%d+L, %d+B" },
        --         { find = "; after #%d+" },
        --         { find = "; before #%d+" },
        --         { find = "%d fewer lines" },
        --         { find = "%d more lines" },
        --       },
        --     },
        --     opts = { skip = true },
        --     -- view = "mini",
        --   },
        -- },
        views = {
          -- system message position and fade time
          mini = {
            timeout = 1000,
            align = "message-left",
            position = {
              col = 0,
              row = -1,
            },
          },
        },
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = true, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = true, -- add a border to hover docs and signature help
        },
      }
    end,
  },
}

return M
