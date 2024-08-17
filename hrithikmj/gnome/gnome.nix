{ config, pkgs, ... }:

{
  imports = [
    ./extensions.nix
    ./gtk.nix
  ];
  dconf.settings = {
    "org/gnome/shell" = {
      favorite-apps = [
        "brave-browser.desktop"
        "org.gnome.Console.desktop"
        "code.desktop"
        "org.gnome.Nautilus.desktop"
      ];
    };

    "org/gnome/desktop/interface" = {

      #fonts
      font-name = "Source Sans 3 Medium 12";
      document-font-name = "Source Sans 3 Medium 12";
      monospace-font-name = "Source Code Pro 10";


      #clock in top bar
      clock-show-seconds = true;
      clock-show-weekday = true;

      #dark theme
      color-scheme = "prefer-dark";
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
      action-double-click-titlebar = "toggle-maximize";
    };

    "org/gnome/desktop/peripherals/keyboard" = {
      numlock-state = true;
      remember-numlock-state = true;
    };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = true;
      night-light-schedule-automatic = true;
      night-light-temperature = "2700";
    };

    "org/blueman/general" = {
      plugin-list = [
        "!ConnectionNotifier"
        "!StatusNotifierItem"
      ];
    };
    "org/gnome/desktop/wm/keybindings" = {
      show-desktop = [ "<Super>d" ];
    };

    "org/gnome/desktop/app-folders/folders/34ef9738-be1a-4e66-82a3-4fca8235702a" = {
      apps = ''['lock.desktop', 'logout.desktop', 'shutdown.desktop', 'sleep.desktop', 'restart.desktop']'';
      name = "Unnamed Folder";
    };
  };
}
