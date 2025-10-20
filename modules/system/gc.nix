# Handling of the NixStore using GC

{ config, pkgs, ... }:
{
  nix.settings.auto-optimise-store = true;

  nix.gc = {
    automatic = true;
    persistent = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };
}
