{ config, pkgs, ... }:

{
  services.xserver.displayManager.gdm.enable = true;
  # services.xserver.displayManager.gdm.settings = {
  # };
  # Enable the GNOME Desktop Environment.
  services.xserver.desktopManager.gnome.enable = true;

  programs.dconf.enable = true;

  programs.dconf.profiles = {
    gdm.databases = [{
      settings = {
        "org/gnome/desktop/peripherals/keyboard" = {
          numlock-state = true;
          remember-numlock-state = true;
        };
      };
    }];
  };

}
