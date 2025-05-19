# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ../hardware/hardware-configuration.nix

      # Docker
      ./docker/docker.nix

      # Hyprland
      ./hyprland/hyprland.nix

      # GDM
      ./gdm/gdm.nix

      # # K8S
      # ./k8s/k8s.nix

      # Ollama
      ./ollama/ollama.nix

      # SSH
      ./ssh/ssh.nix

      # Networking
      ./networking/networking.nix

      # Tailscale
      ./tailscale/tailscale.nix

      # # Postgres
      # ./postgresql/postgresql.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_IN";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  # # Enable the X11 windowing system.
  services.xserver.enable = true;


  # Enable CUPS to print documents.
  services.printing.enable = false;

  # Bluetooth
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  services.blueman.enable = true;
  hardware.bluetooth.settings = {
    General = {
      Experimental = true;
    };
  };
  # Enable sound with pipewire.

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
  programs.zsh.enable = true;
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.hrithikmj = {
    isNormalUser = true;
    description = "Hrithik MJ";
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [
      #  thunderbird

    ];
  };
  users.users.saam = {
    isNormalUser = true;
    description = "Saam J";
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "sudo" ];
    packages = with pkgs; [
      #  thunderbird

    ];
  };
  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Applications
    vim
    wget
    brave
    chromium
    vscode
    gh
    gnome-tweaks
    polymc
    spotify
    vlc
    discord
    telegram-desktop
    lutris
    python3

    # Utils
    git
    lshw
    lsof
    openssl
    gcc
    pipewire
    bluez

    #hyprland
    waybar
    dunst
    kitty
    libnotify
    swww
    rofi-wayland
    brightnessctl
    eww
    cliphist
    wl-clipboard
  ];
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  environment.variables.EDITOR = "vim";
  fonts.packages = with pkgs; [
    (nerdfonts.override {
      fonts = [
        "FiraCode"
        "DroidSansMono"
        "Hack"
        "JetBrainsMono"
      ];
    })
  ];

  # environment.systemPackages = [
  #   (pkgs.waybar.overrideAttrs (oldAttrs: {
  #     mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
  #   })
  #   )
  # ];
  # Remove generations older than 7d
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 7d";
  };
  systemd.services."user@".serviceConfig.Delegate = "memory pids cpu cpuset io";
  # cuda 
  nix.settings = {
    substituters = [
      "https://cuda-maintainers.cachix.org"
      "https://hyprland.cachix.org"
    ];
    trusted-public-keys = [
      "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
  };

  # # Samba
  # services.samba = {
  #   enable = true;
  #   securityType = "user";
  #   openFirewall = true;
  #   settings = {
  #     global = {
  #       "workgroup" = "WORKGROUP";
  #       "server string" = "smbnix";
  #       "netbios name" = "smbnix";
  #       "security" = "user";
  #       #"use sendfile" = "yes";
  #       #"max protocol" = "smb2";
  #       # note: localhost is the ipv6 localhost ::1
  #       "hosts allow" = "192.168.0. 127.0.0.1 localhost";
  #       "hosts deny" = "0.0.0.0/0";
  #       "guest account" = "nobody";
  #       "map to guest" = "bad user";
  #     };
  #     "public" = {
  #       "path" = "/home/hrithikmj/Shares/Public";
  #       "browseable" = "yes";
  #       "read only" = "no";
  #       "guest ok" = "yes";
  #       "create mask" = "0644";
  #       "directory mask" = "0755";
  #       "force user" = "username";
  #       "force group" = "groupname";
  #     };
  #     "private" = {
  #       "path" = "/home/hrithikmj/Shares/Private";
  #       "browseable" = "yes";
  #       "read only" = "no";
  #       "guest ok" = "no";
  #       "create mask" = "0644";
  #       "directory mask" = "0755";
  #       "force user" = "username";
  #       "force group" = "groupname";
  #     };
  #   };
  # };

  # services.samba-wsdd = {
  #   enable = true;
  #   openFirewall = true;
  # };



  # k8s
  # services.kubernetes.roles = [ "master" "node" ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.

  # networking.firewall.enable = true;
  # networking.firewall.allowPing = true;

  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
