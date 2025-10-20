# Configuring Bluetooth

{config, pkgs, lib, ...}:
{
  # Bluetooth core stack
  hardware.bluetooth = {
    enable = true;

    powerOnBoot = true;

    # Writing bluetooth/main.conf
    settings = {
      Policy = {
        AutoEnable = true;
      };

      General = {
        ControllerMode = "dual";
      };
    };
  };

  # Enabling blueman GUI
  services.blueman.enable = true;
}
