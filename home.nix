# home.nix : Main configuration for the NixOS home manager.

{ config, pkgs, ...}:
{
  home.username = "lazzy07";
  home.homeDirectory = "/home/lazzy07";
  home.stateVersion = "25.05";
  
  imports = [
    ./home/modules/git.nix
  ];

  programs.zsh = {
    enable = true;
    shellAliases = {
      btw = "echo I use Arch/Hyprland btw.";
    };
  };
  
}
