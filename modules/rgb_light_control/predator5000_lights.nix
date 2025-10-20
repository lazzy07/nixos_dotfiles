# This module will control all the Predator Orion 5000's CPU lights.
# Essentialy what this module is doing is install OpenRGB to control them

{ config, pkgs, lib, ... }:
let
  user = "lazzy07";
in
{
  # Enable i2c (This loads i2c-dev and creates the i2c group)
  hardware.i2c.enable = true;

  services.hardware.openrgb = {
    enable = true;
    package = pkgs.openrgb-with-all-plugins;
    server.port = 6742;
  };

  # Load the kernel module
  boot.kernelModules = ["i2c-i801"];

  users.users.${user}.extraGroups = lib.mkAfter([
    "i2c"
    "video"   # for led controls on the GPUs
    "plugdev" # udev rules
  ]);

  environment.systemPackages = [pkgs.openrgb-with-all-plugins];
}
