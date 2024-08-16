{ config, lib, pkgs, ... }:
{
  virtualisation.docker = {
    enable = false;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
    # TODO Change it to HDD
    # daemon.settings = {
    #   data-root = "/some-place/to-store-the-docker-data";
    # };
  };
  # TODO Config for containers as systemd services
  #   virtualisation.oci-containers = {
  #   backend = "docker";
  #   containers = {
  #     foo = {
  #       # ...
  #     };
  #   };
  # };
}
