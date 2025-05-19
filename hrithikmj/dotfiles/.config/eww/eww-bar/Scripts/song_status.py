#!/run/current-system/sw/bin/python3

import subprocess
import time

while True:

    mpc_status = subprocess.run(
        "playerctl metadata --format '{{ artist }} - {{ title }}'",
        shell=True,
        capture_output=True,
    ).stdout.decode("utf-8")
    mpc_status = mpc_status.split("\n")

    if len(mpc_status) > 1:
        print(mpc_status)
        status = mpc_status[0]
        status = status.split("-")
        status = f"{status[0]} - {status[1]}"

        # if len(status) >= 27:
        #     status = status[0 : len(status) - (len(status) - 23)]
        #     status = f"{status}.."

        subprocess.run(f'echo "{status}"', shell=True)
    else:
        subprocess.run("echo 'Play something'", shell=True)

    time.sleep(0.2)
