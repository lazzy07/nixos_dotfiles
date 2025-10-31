{ configs, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    shellAliases = {
      btw = "echo I use Arch (NixOS) with Hyprland BTW";
    };
    profileExtra = ''
      if [ -z "$WAYLAND_DISPLAY"] && [ "$XDG_VTNR" = 1 ]; then
        exec uwsm start -S hyprland-uwsm.desktop
      fi
    '';
  };
}
