#!/run/current-system/sw/bin/python3

import subprocess
import os
import socket

icons = [
    "󰄰",
    "󰄰",
    "󰄰",
    "󰄰",
    "󰄰",
    "󰄰",
    "󰄰",
    "󰄰",
    "󰄰",
    "󰄰",
    "󰄯",
    "󰄯",
    "󰄯",
    "󰄯",
    "󰄯",
    "󰄯",
    "󰄯",
    "󰄯",
    "󰄯",
    "󰄯",
]


def update_workspace(active_workspace):
    icons_index = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

    icons_index[active_workspace - 1] = icons_index[active_workspace - 1] + 10
    prompt = f'(box (label :text "{icons[icons_index[0]]}  {icons[icons_index[1]]}  {icons[icons_index[2]]}  {icons[icons_index[3]]}  {icons[icons_index[4]]}  {icons[icons_index[5]]}  {icons[icons_index[6]]}  {icons[icons_index[7]]}  {icons[icons_index[8]]}  {icons[icons_index[9]]}" ))'

    subprocess.run(f"echo '{prompt}'", shell=True)


sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)

server_address = f'{os.environ["XDG_RUNTIME_DIR"]}/hypr/{os.environ["HYPRLAND_INSTANCE_SIGNATURE"]}/.socket2.sock'
# print(server_address)
sock.connect(server_address)

while True:
    try:
        new_event = sock.recv(4096).decode("utf-8")

        for item in new_event.split("\n"):
            # print(item)
            if "workspace>>" == item[0:11]:
                print(item)
                workspaces_num = item[-1]

                update_workspace(int(workspaces_num))
    except Exception as e:
        print(e)
