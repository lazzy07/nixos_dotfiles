# Configuring Nvidia drivers
{ config, pkgs, ... }:
{
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = false; # To be used on laptops
    open = false; # Do not use opensource drivers, instead use proprietary
    nvidiaSettings = true; # Enable nvidia-settings GUI
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
