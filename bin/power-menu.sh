
#!/usr/bin/env bash

set -euo pipefail

# Rofi theme and appearance can be customized with your Rofi config.
ROFI="rofi -dmenu -i -p"

confirm() {
    local action="$1"
    local choice

    choice=$(printf 'No\nYes' | rofi -dmenu -i -p "Confirm $action?")

    [[ "$choice" == "Yes" ]]
}

main() {
    local choice

    choice=$(printf '%s\n' \
        "  Lock" \
        "󰒲  Suspend" \
        "󰗼  Exit Sway" \
        "󰜉  Restart" \
        "  Power Off" |
        rofi -dmenu -i -p "Power Menu") || exit 0

    case "$choice" in
        *"Power Off")
            if confirm "Power Off"; then
                systemctl poweroff
            fi
            ;;
        *"Restart")
            if confirm "Restart"; then
                systemctl reboot
            fi
            ;;
        *"Exit Sway")
            if confirm "Exit Sway"; then
                swaymsg exit
            fi
            ;;
        *"Suspend")
            if confirm "Suspend"; then
                systemctl suspend
            fi
            ;;
        *"Lock")
            if confirm "Lock"; then
                loginctl lock-session
            fi
            ;;
    esac
}

main

