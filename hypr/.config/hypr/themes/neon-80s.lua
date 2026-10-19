-- 80s NEON / SYNTHWAVE THEME
-- Hot gradients, glow, saturated accents.

return {
    gaps_in     = 5,
    gaps_out    = 10,
    border_size = 4,

    active_border   = { colors = { "rgba(b026ffee)", "rgba(05d9e8ee)" }, angle = 45 },
    inactive_border = "rgba(45454fcc)",

    rounding       = 6,
    rounding_power = 2,

    shadow = {
        enabled      = true,
        range        = 5,
        render_power = 3,
        color        = 0x55d300c5,
    },

    blur = {
        enabled  = true,
        size     = 6,
        passes   = 2,
        vibrancy = 0.1696,
    },

}
