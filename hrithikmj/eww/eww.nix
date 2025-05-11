{ config, lib, pkgs, ... }:
{
  programs.eww.enable = true;
  services.xserver.desktopManager.gnome.enable = false;
}
