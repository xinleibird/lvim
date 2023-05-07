if vim.g.neovide then
  -- <ENVIRONMENTS>
  -- when open vide, pwd is "/", so jump to $HOME
  if vim.fn.getcwd() == "/" then
    -- vim.fn.chdir("$HOME")
    if vim.v.vim_did_enter then
      vim.api.nvim_set_current_dir("$HOME")
    else
      vim.api.nvim_create_autocmd({ "UIEnter" }, {
        pattern = "*",
        command = "chdir $HOME"
      })
    end
  end
  -- set $LANG variable for no login environment
  vim.fn.setenv("LANG", "en_US.UTF-8")


  -- <FONT>
  -- font family
  vim.opt.guifont            = "JetBrainsMono Nerd Font Mono:h13:#h-none"
  -- linespace
  vim.opt.linespace          = 0
  -- scaling font without font size vim.g.neovide_scale_factor = 1.0
  vim.g.neovide_scale_factor = 1.0


  -- <WINDOW>
  -- padding
  vim.g.neovide_padding_top                 = 20
  vim.g.neovide_padding_bottom              = 20
  vim.g.neovide_padding_right               = 0
  vim.g.neovide_padding_left                = 0
  -- Helper function for transparency formatting
  local alpha                               = function()
    return string.format("%x", math.floor(255 * (vim.g.transparency or 0.8)))
  end
  -- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
  vim.g.neovide_transparency                = 0.0
  vim.g.transparency                        = 1.0
  vim.g.neovide_background_color            = "#1b1b25" .. alpha()
  -- blur
  vim.g.neovide_floating_blur_amount_x      = 2.0
  vim.g.neovide_floating_blur_amount_y      = 2.0
  -- scrool animation duration
  vim.g.neovide_scroll_animation_length     = 0.3
  -- hide mouse when typing
  vim.g.neovide_hide_mouse_when_typing      = true
  -- scaling 'underline' character automatic
  vim.g.neovide_underline_automatic_scaling = false
  -- refresh rate when vide Foreground or Background
  vim.g.neovide_refresh_rate                = 60
  vim.g.neovide_refresh_rate_idle           = 5
  -- force stop idle: always 60 fps
  vim.g.neovide_no_idle                     = false
  -- no effect now
  -- vim.g.neovide_confirm_quit = true
  -- Fullscreen
  vim.g.neovide_fullscreen                  = true
  -- remember window size
  vim.g.neovide_remember_window_size        = true
  -- 'profiler' is a indentifier to show FPS in window etc
  vim.g.neovide_profiler                    = false


  -- <INPUT>
  -- keyboard Super Command Option key, macOs default true
  vim.g.neovide_input_use_logo          = true -- true on macOS
  vim.g.neovide_input_macos_alt_is_meta = true
  -- touchpad
  vim.g.neovide_touch_deadzone          = 6.0
  vim.g.neovide_touch_drag_timeout      = 0.17


  -- <ANIMATION>
  -- cursor animation duration and style
  vim.g.neovide_cursor_animation_length        = 0.06
  vim.g.neovide_cursor_trail_size              = 0.4
  vim.g.neovide_cursor_antialiasing            = true
  vim.g.neovide_cursor_animate_in_insert_mode  = true
  vim.g.neovide_cursor_animate_command_line    = true
  vim.g.neovide_cursor_unfocused_outline_width = 0.125
  -- cursor vfx mode
  -- "railgun", "torpedo","pixiedust", "sonicboom", "wireframe", "ripple", default is blank: ""
  vim.g.neovide_cursor_vfx_mode                = "ripple"
  vim.g.neovide_cursor_vfx_opacity             = 200.0
  vim.g.neovide_cursor_vfx_particle_lifetime   = 1.2
  vim.g.neovide_cursor_vfx_particle_density    = 7.0
  vim.g.neovide_cursor_vfx_particle_speed      = 10.0
  -- vim.g.neovide_cursor_vfx_particle_phase      = 1.5 -- just for railgun
  -- vim.g.neovide_cursor_vfx_particle_curl       = 1.0 -- just for railgun
end
