{ config, lib, pkgs, ... }:
let
  orchis = (pkgs.orchis-theme.override {
    border-radius = 3;
    tweaks = [ "compact" "macos" "submenu" ];
  });
in
{
  home.packages = with pkgs; [
    orchis
    tela-icon-theme
  ];

  gtk = {
    enable = true;
    theme = {
      name = "Orchis-Dark";
      package = orchis;
    };

    iconTheme = {
      name = "Tela";
      package = pkgs.tela-icon-theme;
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };

}
