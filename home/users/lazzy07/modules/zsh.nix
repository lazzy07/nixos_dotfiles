{ configs, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    shellAliases = {
      btw = "echo I use Arch (NixOS) with Hyprland BTW";
    };
  };
}
