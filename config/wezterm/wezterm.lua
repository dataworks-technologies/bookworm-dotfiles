-- ~/.config/wezterm/wezterm.lua
-- Optimized WezTerm configuration for better performance
local wezterm = require "wezterm"
local act = wezterm.action


local config = wezterm.config_builder()


config.color_scheme = 'Abernathy'

-- Font configuration with minimal fallbacks for better performance
config.font = wezterm.font_with_fallback({
  { family = 'Jetbrains Mono', weight = 'Regular' },
  { family = 'FiraCode Nerd Font Mono', weight = 'Regular' },
  { family = 'Symbols Nerd Font Mono', weight = 'Regular' },
})

-- Tab bar with Jetbrains Mono font
config.window_frame = {
  font = wezterm.font { family = 'Jetbrains Mono', weight = 'Regular' },
  font_size = 12.0,
--  active_titlebar_bg = colors.bg,
}

-- Performance optimizations
config.max_fps = 120
config.animation_fps = 1
-- config.line_height = 1.1
config.window_background_opacity = 0.85
config.enable_scroll_bar = false
config.use_fancy_tab_bar = true
config.font_size = 12
config.term = "xterm-256color"
config.warn_about_missing_glyphs = false




-- -- NVIDIA optimization settings
-- config.enable_wayland = not is_nvidia_gpu() -- Disable Wayland if NVIDIA GPU is detected
config.front_end = "OpenGL"  -- More stable than WebGPU with NVIDIA
config.webgpu_power_preference = "HighPerformance"
config.prefer_egl = true
config.freetype_load_target = "Light"
config.freetype_render_target = "HorizontalLcd"

return config
