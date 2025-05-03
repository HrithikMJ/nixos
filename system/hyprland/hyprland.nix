{ config, pkgs, ... }:

{
  services.greetd = {
    enable = true;
    regreet = true;
    # settings = rec {
    #   initial_session = {
    #     command = "${pkgs.sway}/bin/sway";
    #     user = "myuser";
    #   };
    #   default_session = initial_session;
    # };
  };
  programs.hyprland.enable = true; # enable Hyprland

  environment.systemPackages = [
    # ... other packages
    pkgs.kitty # required for the default Hyprland config
  ];
  # Optional, hint Electron apps to use Wayland:
  # environment.sessionVariables.NIXOS_OZONE_WL = "1";
  programs.hyprland.withUWSM = true;


}
