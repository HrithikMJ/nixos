{ config, pkgs, ... }:
{
  system.ollama = {
    enable = true;
    acceleration = "cuda";
  };
}
