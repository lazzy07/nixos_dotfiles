# User profile (lazzy07) configurations

{ config, pkgs, lib, ... }:
{
  users.users."lazzy07" = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ]; # Adds sudo + network control
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = [
     "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMsJTSdJlEBs3n0vYCjGEWXo/J7WTkf58KxzLztsWQZR lazzy07@nixos-predator5000-20250920"
     "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOuBQZ02n9crcp3S/01DYAUXKEqzAv96uJMwfY+86qUA lazzy07@windows-LazzysSP5"
    ];
  };

  security.sudo.enable = true;
}


