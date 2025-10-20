# NixOS configuration v1.0.0
# Created by @lazzy07

{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./modules/boot/bootloader.nix # Bootloader configurations
      ./modules/rgb_light_control/predator5000_lights.nix
      ./modules/hardware/nvidia.nix # Nvidia driver configurations
      ./modules/login_managers/getty.nix
    ];

  # Networking functionality
  networking.hostName = "predator5000"; # Define your hostname.
  networking.wireless.enable = false;  # Diasble legacy wpa_supplicant.
  networking.wireless.iwd.enable = false; # Disable iwd, let networkmanager handle it.

  # Enable networking
  networking.networkmanager.enable = true;
 
  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  # services.displayManager.sddm.enable = true;
  # services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [
    logiops # Master 3S Mouse support
    vim 
    wget
    git
    neovim
    kitty
    waybar
    hyprpaper
  ];

  # System version
  system.stateVersion = "25.05"; 

  # Install flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}
