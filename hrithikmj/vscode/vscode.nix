{ config, lib, pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions;[
      github.github-vscode-theme
      golang.go
      ms-python.black-formatter
      ms-python.python
      ms-python.vscode-pylance
      ms-python.debugpy
      vscode-icons-team.vscode-icons
      jnoortheen.nix-ide
      esbenp.prettier-vscode
      jdinhlife.gruvbox
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [{
      name = "gruvbox-material-icon-theme";
      publisher = "JonathanHarty";
      version = "1.1.5";
      sha256 = "sha256-86UWUuWKT6adx4hw4OJw3cSZxWZKLH4uLTO+Ssg75gY=";
    }];
    userSettings = {
      "[nix]" = {
        "editor.defaultFormatter" = "jnoortheen.nix-ide";
        "editor.tabSize" = "2";
      };
      "workbench.iconTheme" = "gruvbox-material-icon-theme";
      "editor.fontFamily" = "'Droid Sans Mono', 'monospace', monospace,'FiraCode Nerd Font'";
      "workbench.settings.applyToAllProfiles" = [
        "editor.fontFamily"
      ];
      "git.confirmSync" = false;
      "editor.fontSize" = 15;
      "telemetry.telemetryLevel" = "off";
      "editor.wordWrap" = "on";
      "editor.formatOnPaste" = false;
      "editor.formatOnSave" = true;
      "window.zoomLevel" = 2.5;
      "workbench.colorTheme" = "Gruvbox Dark Hard";
    };

  };
}
