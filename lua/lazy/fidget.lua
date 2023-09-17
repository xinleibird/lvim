local M = {
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    event = "LspAttach",
    opts = {
      text = {
        spinner = { "", "", "", "" },
        done = "", -- character shown when all tasks are complete
        commenced = "", -- message shown when task starts
        completed = "", -- message shown when task completes
      },
      align = {
        bottom = true, -- align fidgets along bottom edge of buffer
        right = true, -- align fidgets along right edge of buffer
      },
      timer = {
        spinner_rate = 125, -- frame rate of spinner animation, in ms
        fidget_decay = 1000, -- how long to keep around empty fidget, in ms
        task_decay = 500, -- how long to keep around completed task, in ms
      },
      window = {
        relative = "win", -- where to anchor, either "win" or "editor"
        blend = 100, -- &winblend for the window
        zindex = nil, -- the zindex value for the window
        border = "none", -- style of border for the fidget window
      },
      fmt = {
        leftpad = true, -- right-justify text in fidget box
        stack_upwards = true, -- list of tasks grows upwards
        max_width = 0, -- maximum width of the fidget box
        -- function to format fidget title
        fidget = function(fidget_name, spinner)
          return string.format("%s %s ", fidget_name, spinner)
        end,
        -- function to format each task line
        task = function(task_name, message, percentage)
          if #message > 42 then
            message = string.format("%.39s...", message)
          end
          if #task_name > 42 then
            task_name = string.format("%.39s...", task_name)
          end
          return string.format(
            "%s [%s] %s ",
            percentage and string.format(" (%s%%)", percentage) or "",
            task_name,
            message
          )
        end,
      },
      sources = { -- Sources to configure
        ["*"] = { -- Name of source
          ignore = false, -- Ignore notifications from this source
        },
      },
      debug = {
        logging = false, -- whether to enable logging, for debugging
        strict = false, -- whether to interpret LSP strictly
      },
    },
  },
}

return M
