import os
import subprocess

from arguments import arguments
from settings.setting import Setting

POLYBAR_LAUNCH = ".config/polybar/launch.sh"
EWW_LAUNCH = ".config/eww/bar/launch_bar"


def get_status_bar(settings: Setting) -> str:
    if settings.use_polybar:
        return POLYBAR_LAUNCH

    if settings.use_eww:
        return EWW_LAUNCH

    return POLYBAR_LAUNCH


def start_status_bar(status_bar_path: str, args: str) -> None:
    launch_script = os.path.join(os.environ["HOME"], status_bar_path)
    command = [launch_script, args]
    try:
        process = subprocess.Popen(command)
        process.communicate()  # Wait for the process to complete
        if process.returncode != 0:
            raise subprocess.CalledProcessError(process.returncode, command)
    except subprocess.CalledProcessError as e:
        print(f"Command execution failed with return code {e.returncode}: {e.cmd}")


def main():
    settings = arguments.get_input_config()
    status_bar_path = get_status_bar(settings)
    start_status_bar(status_bar_path, settings.command)


if __name__ == "__main__":
    main()
