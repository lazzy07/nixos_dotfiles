{ config, pkgs, lib, ... }:
{
  # Enable hyprland
  wayland.windowManager.hyprland.enable = true;

  # bind .config files
  xdg.configFile."hypr".source = ./.config/hypr;

  # hyprland requirements
  home.packages = with pkgs; [ 
    hypridle
    brightnessctl
  ];
}
