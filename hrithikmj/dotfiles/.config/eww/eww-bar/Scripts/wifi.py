#!/run/current-system/sw/bin/python3
import subprocess

icons = [
    "󰤭",
    "󰤯",
    "󰤟",
    "󰤢",
    "󰤥",
    "󰤨",
]

# Get current wifi card status
battery_status = subprocess.run(
    "nmcli device show wlo1  | grep GENERAL.STATE", shell=True, capture_output=True
).stdout.decode("utf-8")
# nmcli dev wifi list | awk '/\*/{if (NR!=1) {print $8}}
wifi_signal = subprocess.run(
    "nmcli -f IN-USE,SIGNAL device wifi | grep '*' | awk '{printf $2}'",
    shell=True,
    capture_output=True,
).stdout.decode("utf-8")
# if returned string is 0 means there is not any active connection
battery_status = battery_status.split(":")[1].strip()
if battery_status == "100 (connected)":
    # print(wifi_signal)
    match wifi_signal:
        case s if int(s) >= 80:
            print(icons[5])
        case s if int(s) < 80 and int(s) >= 60:
            print(icons[4])
        case s if int(s) < 60 and int(s) >= 40:
            print(icons[3])
        case s if int(s) < 40 and int(s) >= 20:
            print(icons[2])
        case _:
            print(icons[1])
else:
    print(icons[1])
