{ config, pkgs, lib, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      "$mod" = "SUPER";

      bind = [
        "$mod, RETURN, exec, kitty"
	"$mod, Q, closewindow"
	"$mod SHIFT, Q, killactive"
	"$mod SHIFT, R, reload"
      ];

      exec-once = ["hypridle"];
    };
  }
}
