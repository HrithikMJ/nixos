#!/run/current-system/sw/bin/python3

import subprocess

eww_status = (
    subprocess.run(
        "eww --config ~/nixos/hrithikmj/dotfiles/.config/eww/eww-bar/ active-windows | grep clipboard_manager",
        shell=True,
        capture_output=True,
    )
    .stdout.decode("utf-8")
    .strip()
    .split("\n")
)
# Checks if window is opened
print(eww_status)
if eww_status[0] == "":
    subprocess.run(
        "eww --config ~/nixos/hrithikmj/dotfiles/.config/eww/eww-bar/ open clipboard_manager",
        shell=True,
    )

else:
    subprocess.run(
        "eww --config ~/nixos/hrithikmj/dotfiles/.config/eww/eww-bar/ close clipboard_manager",
        shell=True,
    )
