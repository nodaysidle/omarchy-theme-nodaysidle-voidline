-- nodaysidle Voidline — Hyprland Configuration (Lua)
-- Pitch OLED Void & Razor-Sharp Laser Cyan

local active_border_color = {
  colors = {
    "rgb(00e5ff)", -- Laser Electric Cyan
    "rgb(005577)", -- Deep Cyan Depth
    "rgb(1e90ff)", -- Telemetry Cobalt
    "rgb(000000)", -- Void Black
  },
  angle = 90,
}

local inactive_border_color = {
  colors = {
    "rgb(151a24)", -- Deep Circuit Charcoal
    "rgb(000000)", -- Pitch Black
  },
  angle = 90,
}

hl.config({
  general = {
    col = {
      active_border = active_border_color,
      inactive_border = inactive_border_color,
    },
    gaps_in = 4,
    gaps_out = { top = 4, right = 8, bottom = 8, left = 8 },
    border_size = 2,
  },

  group = {
    col = {
      border_active = active_border_color,
      border_inactive = inactive_border_color,
      border_locked_active = active_border_color,
      border_locked_inactive = inactive_border_color,
    },

    groupbar = {
      col = {
        active = "rgba(0, 229, 255, 0.30)",
        inactive = "rgba(0, 0, 0, 0.90)",
      },
      text_color = "rgb(eef2f6)",
      text_color_inactive = "rgba(100, 116, 139, 0.70)",
      blur = false,
      gradient_rounding = 0,
    },
  },

  decoration = {
    rounding = 0, -- Razor-sharp telemetry corners

    active_opacity = 1.0,
    inactive_opacity = 0.92,

    dim_inactive = true,
    dim_strength = 0.22,
    dim_special = 0.35,

    blur = { enabled = false }, -- Zero blur overhead for max speed

    shadow = {
      enabled = true,
      range = 20,
      render_power = 2,
      color = "rgba(0, 229, 255, 0.22)", -- Subtle laser aura glow
    },
  },
})

-- Laser Pulse Curve
hl.curve("voidlineLaser", { type = "bezier", points = { { 0.05, 0.95 }, { 0.15, 1.00 } } })

hl.animation({ leaf = "borderangle", enabled = false })
hl.animation({
  leaf = "windows",
  enabled = true,
  speed = 2.8,
  bezier = "voidlineLaser",
})

hl.animation({ leaf = "layersIn", enabled = true, speed = 2.2, bezier = "voidlineLaser", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.8, bezier = "voidlineLaser", style = "fade" })

o.window({ tag = "terminal" }, { tag = "-default-opacity", opacity = "1.0 1.0" })
o.window({ tag = "default-opacity" }, { opacity = "1.0 1.0" })
o.window({ class = "com.mitchellh.ghostty" }, { opacity = "1.0 1.0" })
o.window({ title = "^Herdr.*" }, { opacity = "1.0 1.0" })

hl.layer_rule({ match = { namespace = "^(omarchy-bar|omarchy-notifications|omarchy-osd|omarchy-reminders)$" }, blur = false })
