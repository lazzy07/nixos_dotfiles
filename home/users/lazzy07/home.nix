# Home configurations for lazzy07
{ config, pkgs, ... }:
{
  home.username = "lazzy07";
  home.homeDirectory = "/home/lazzy07";
  home.stateVersion = "25.05";

  imports = [
    ./modules/zsh/zsh.nix
    ./modules/git/git.nix
    ./modules/hyprland/hypridle.nix
    ./modules/hyprland/hyprland.nix
  ];
}

