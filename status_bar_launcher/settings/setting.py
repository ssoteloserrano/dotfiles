from dataclasses import dataclass


@dataclass
class Setting:
    command: str = ""
    use_polybar: bool = True
    use_eww: bool = False

    @classmethod
    def from_dict(cls, _dict):
        return Setting(
            command=_dict.get("command"),
            use_polybar=_dict.get("use_polybar"),
            use_eww=_dict.get("use_eww"),
        )
