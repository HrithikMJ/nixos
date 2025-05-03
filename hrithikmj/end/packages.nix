{ pkgs, ... }:
{

  home = {
    packages = with pkgs; with nodePackages_latest; with gnome; with libsForQt5; [
      sway

      # gui
      blueberry
      (mpv.override { scripts = [ mpvScripts.mpris ]; })
      d-spy
      dolphin
      icon-library
      dconf-editor
      qt5.qtimageformats

      # tools
      libnotify
      kitty
      showmethekey

      # theming tools
      gradience
      gnome-tweaks

      # hyprland
      brightnessctl
      cliphist
      fuzzel
      grim
      hyprpicker
      tesseract
      imagemagick
      playerctl
      swappy
      swaylock-effects
      swayidle
      slurp
      swww
      wayshot
      wlsunset
      wl-clipboard
      wf-recorder

      # very important stuff
      # uwuify
    ];
  };
}
