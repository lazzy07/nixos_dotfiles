{ config, pkgs, lib, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      "$mod" = "SUPER";

      bind = [
        "$mod, RETURN, exec, kitty"
	"$mod, q, killactive"
	"$mod SHIFT, q, forcekillactive"
	"$mod SHIFT, r, exec, hyprctl reload"
      ];

      exec-once = ["hypridle"];
    };
  };
}
