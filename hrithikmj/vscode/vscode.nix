{ config, lib, pkgs, ... }:
{
  programs.vscode = {
    extentions = with pkgs.vscode-extensions;[
      github.github-vscode-theme
      golang.go
      ms-python.black-formatter
      ms-python.python
      ms-python.vscode-pylance
      ms-python.debugpy
      vscode-icons-team.vscode-icons
      jnoortheen.nix-ide
      esbenp.prettier-vscode
    ];
    userSettings = {
      "[nix]" = {
        "editor.defaultFormatter" = "jnoortheen.nix-ide";
        "editor.tabSize" = "2";
      };
      "workbench.iconTheme" = "vscode-icons";
      "editor.fontFamily" = "'Droid Sans Mono', 'monospace', monospace,'FiraCode Nerd Font'";
      "workbench.settings.applyToAllProfiles" = [
        "editor.fontFamily"
      ];
      "git.confirmSync" = false;
      "editor.fontSize" = 15;
      "telemetry.telemetryLevel" = "off";
      "editor.wordWrap" = "on";
      "editor.formatOnPaste" = true;
      "editor.formatOnSave" = true;
      "window.zoomLevel" = 2.5;
    };

  };
}
