{ config, lib, pkgs, modulesPath, ... }:
{
  services.tailscale.enable = true;
  # services.netbird.enable = true;
}
