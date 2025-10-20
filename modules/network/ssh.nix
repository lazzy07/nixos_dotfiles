{ config, lib, pkgs, ... }:
let
  sshPort = 5991;
in
{
  services.openssh = {
    enable = true;
    
    ports = [sshPort];

    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
      X11Forwarding = false;
      AllowAgentForwarding = "yes";
      AllowTcpForwarding = "yes";
      TCPKeepAlive = "yes";
      ClientAliveInterval = 30;
      ClientAliveCountMax = 3;
    };

    hostKeys = [
      {type = "ed25519"; path = "/etc/ssh/ssh_host_ed25519_key"; }
      {type = "rsa"; path = "/etc/ssh/ssh_host_rsa_key"; bits = 4096; }
    ];
  };

  networking.firewall.allowedTCPPorts = [ sshPort ];
}
