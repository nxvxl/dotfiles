-- WARM PAPER THEME
-- Clean, modern, minimalist. Flat surfaces, one accent, no glow.

return {
    gaps_in     = 6,
    gaps_out    = 12,
    border_size = 2,

    active_border   = { colors = { "rgba(3b6ef5ff)", "rgba(3b6ef5ff)" }, angle = 45 },
    inactive_border = "rgba(d8dadeff)",

    rounding       = 8,
    rounding_power = 2,

    shadow = {
        enabled      = true,
        range        = 12,
        render_power = 3,
        color        = 0x1a000000,
    },

    blur = {
        enabled  = false,
        size     = 3,
        passes   = 1,
        vibrancy = 0.1696,
    },
}
