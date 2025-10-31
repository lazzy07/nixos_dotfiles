{ config, pkgs, ... }: 
{
  networking.hostName = "predator5000";
  networking.wireless.enable = false; # disable legacy wpa_applicant
  networking.wireless.iwd.enable = false; # disable iwd, let networkmanager handle it.

  networking.networkmanager.enable = true;

  users.users.lazzy07.extraGroups = [ "networkmanager" ];

  environment.systemPackages = [ pkgs.networkmanagerapplet ];

  services.dbus.enable = true;

}
