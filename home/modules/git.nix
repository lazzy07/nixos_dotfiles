# Home manager git configurations

{ configs, pkgs, lib, ... }:
{
  programs.git = {
    enable = true;
    package = pkgs.gitFull;

    userName = "Lasantha Senanayake";
    userEmail = "222lasantha@gmail.com";

    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
