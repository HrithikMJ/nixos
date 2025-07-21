{ config, ... }:
{
  xdg.configFile."hypr/hyprland.conf".source =
    config.lib.file.mkOutOfStoreSymlink ./.config/hypr/hyprland.conf;
  xdg.configFile."eww".source = config.lib.file.mkOutOfStoreSymlink ./.config/eww;
  xdg.configFile."eww".recursive = true;
}
