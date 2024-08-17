{ config, pkgs, ... }:

{
  dconf.settings = {
    "org/gnome/shell/extensions/dash-to-dock" = {
      background-opacity = 0.94;
      running-indicator-style = "DOTS";
      transparency-mode = "FIXED";
    };
  };
}
