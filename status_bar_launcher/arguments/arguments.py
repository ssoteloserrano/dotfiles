import sys

from settings.setting import Setting


def get_input_config() -> Setting:
    args = sys.argv[1:] if len(sys.argv) > 1 else []
    settings = Setting()

    if len(args) == 0:
        settings.command = ""

        return settings

    if len(args) == 1:
        first_argument = args[0]

        if first_argument.strip() == "-p":
            settings.use_polybar = True

            return settings

        if first_argument.strip() == "-e":
            settings.use_eww = True

            return settings

    if len(args) == 2:
        first_argument = args[0]
        second_argument = args[1]

        if first_argument.strip() == "-p":
            settings.command = second_argument
            settings.use_polybar = True

            return settings

        if first_argument.strip() == "-e":
            settings.command = second_argument
            settings.use_eww = True

            return settings

    return settings
