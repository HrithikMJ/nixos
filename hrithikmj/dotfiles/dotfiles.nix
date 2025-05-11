{ config, impurity, inputs, pkgs, ... }: {
  xdg.configFile = let link = impurity.link; in {
    "hypr".source = link ./.config/hypr;
  };
}
