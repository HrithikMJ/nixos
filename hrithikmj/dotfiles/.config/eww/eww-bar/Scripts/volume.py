#!/run/current-system/sw/bin/python3

import subprocess

icons = ["󰕾", "󰖁"]

# Get current volume status
volume_status = subprocess.run(
    "wpctl get-volume @DEFAULT_SINK@ | awk '{print $2*100}'",
    shell=True,
    capture_output=True,
).stdout.decode("utf-8")

# if returned string is 0 means the volume is muted
if int(volume_status) == 0:
    print(icons[1])
else:
    print(icons[0])
