{ config, pkgs, vars, ... }:
{
  home.packages = with pkgs; [
    gnomeExtensions.user-themes
    gnomeExtensions.blur-my-shell
    gnomeExtensions.dock-from-dash
  ];
  dconf.settings = {
    disable-user-extensions = false;
    enabled-extensions = [
      "apps-menu@gnome-shell-extensions.gcampax.github.com"
      "dash-to-dock@micxgx.gmail.com"
      "system-monitor@gnome-shell-extensions.gcampax.github.com"
      "user-theme@gnome-shell-extensions.gcampax.github.com"
    ];

  };
}
