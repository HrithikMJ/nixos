{ config, ... }:
{
  xdg.configFile."hypr/hyprland.conf".source = ./.config/hypr/hyprland.conf;
  xdg.configFile."eww".source = ./.config/eww;
  xdg.configFile."eww".recursive = true;
}
