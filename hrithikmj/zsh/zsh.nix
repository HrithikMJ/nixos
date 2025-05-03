{ lib, config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      dcode = "devbox run code";
    };
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
    };
  };
}
