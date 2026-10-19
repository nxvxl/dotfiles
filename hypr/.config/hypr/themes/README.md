# Themes

Each file is a Lua module returning a table of look-and-feel values. The active
theme is chosen by the `current.lua` symlink and loaded from `hyprland.lua` with:

```lua
local theme = require("themes/current")
```

Switch themes with `~/.dotfiles/bin/wm-theme <name>`.
