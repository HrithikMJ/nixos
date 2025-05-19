#!/run/current-system/sw/bin/python3

import time
import subprocess

bat_status_arr = ["󱃍", "󰁻", "󰁼", "󰁽", "󰁾", "󰁿", "󰂀", "󰂁", "󰂂", "󰁹"]
bat_status_charging_arr = ["󰢜", "󰂆", "󰂇", "󰂈", "󰢝", "󰂉", "󰢞", "󰂊", "󰂋", "󰂅"]


def get_bat_status():
    acpi = subprocess.run(
        ["cat", "/sys/class/power_supply/BAT0/capacity"], capture_output=True
    )
    status = subprocess.run(
        ["cat", "/sys/class/power_supply/BAT0/status"], capture_output=True
    )
    status = status.stdout.decode("utf-8").strip()
    bat_status = acpi.stdout.decode("utf-8")
    # bat_status = bat_status.split(",")[1]
    bat_perc = bat_status.strip() + "%"
    # bat_status = bat_status.strip()
    # bat_status = bat_status[:-1]
    if status == "Charging":
        bat_status = bat_status_charging_arr[(int(bat_status) // 10) - 1]
    elif status == "Full":
        bat_status = bat_status_charging_arr[-1]
    else:
        bat_status = bat_status_arr[(int(bat_status) // 10) - 1]

    return f"{bat_status}   {bat_perc}"


print(f"{get_bat_status()}")
