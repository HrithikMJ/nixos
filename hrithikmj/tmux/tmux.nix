{ config, pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    shortcut = "a";
  };
}
