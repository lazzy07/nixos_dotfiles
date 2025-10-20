# This file will handle all the bootloader related configs

{config, lib, pkgs, ...}:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.efi.efiSysMountPoint = "/boot";

  boot.loader.timeout = 5;

  # Make windows default by making nixos sort after windows
  boot.loader.systemd-boot.sortKey = "zznixos";

  # Windows entries
  boot.loader.systemd-boot.extraEntries = {
    "windows.conf" = ''
      title   Windows
      efi     /EFI/Microsoft/Boot/bootmgfw.efi
    '';

    # Optional fallback
    "windows-fallback.conf" = ''
      title   Windows (fallback)
      efi     /EFI/Boot/bootx64.efi
    '';
  };


  # Make sure only 3 system versions of NixOS is available (Latest 3 builds of NixOS configurations)
  boot.loader.systemd-boot.configurationLimit = 3;
}
