{ config, pkgs, lib, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    histSize = 10000;
    interactiveShellInit = ''
      export EDITOR = "nvim"
      # Home manger setup here
    '';
  };
}
