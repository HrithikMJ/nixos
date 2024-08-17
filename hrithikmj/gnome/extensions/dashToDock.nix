{ config, pkgs, ... }:

{
  dconf.settings = {
    "org/gnome/shell/extensions/dash-to-dock" = {
      apply-custom-theme = true;
      running-indicator-style = "DOTS";
      transparency-mode = "FIXED";
    };
  };
}
