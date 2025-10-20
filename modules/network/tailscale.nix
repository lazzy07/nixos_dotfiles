# Tailscale to access the PC from anywhere
{ config, pkgs, lib, ... }:
{
  services.tailscale = {
    enable = true;
    useRoutingFeatures = "client";
    openFirewall = true;
  };
}
