#!/usr/bin/python

import os
import subprocess

HOME = os.path.expanduser("~")
OPTIONS = {
    "Switch Audio Output": f"{HOME}/.dotfiles/bin/speaker-selector.sh",
    "Toggle Notification": "dunstctl set-paused toggle && pkill -SIGRTMIN+12 i3blocks",
    "Mic Selector": f"{HOME}/.dotfiles/bin/mic-selector.sh",
    "Emoji": f"{HOME}/.dotfiles/bin/emoji-selector.sh",
    "VPN": f"{HOME}/.dotfiles/bin/rofi-vpn.sh"
}
KEYS = "\n".join(OPTIONS.keys())

result = subprocess.run(["rofi", "-dmenu", "-p", "🎮", "-i"],
                        stdout=subprocess.PIPE,
                        input=KEYS,
                        encoding="ascii")
print(result)
if not result.stdout:
    print("not selected")
    exit(0)

commands = OPTIONS[result.stdout.rstrip("\n")]
print(commands)
if len(commands) > 0:
    result = subprocess.run(commands, shell=True)
    print(result)
