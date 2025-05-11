{ config, pkgs, vars, ... }:
{
  home.packages = with pkgs; [
    gnomeExtensions.user-themes
    gnomeExtensions.blur-my-shell
    gnomeExtensions.dash-to-dock
    gnomeExtensions.clipboard-history
    gnomeExtensions.kando-integration
  ];
  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        "apps-menu@gnome-shell-extensions.gcampax.github.com"
        "dash-to-dock@micxgx.gmail.com"
        "blur-my-shell@aunetx"
        "clipboard-history@alexsaveau.dev"
        "system-monitor@gnome-shell-extensions.gcampax.github.com"
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "kando-integration@kando-menu.github.io"
      ];
    };
  };
}
