{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.grub = {
    enable = true;
    useOSProber = true;
    device = "nodev";
    efiSupport = true;
    extraConfig = ''
      GRUB_TERMINAL_OUTPUT="gfxterm"
    '';
  };
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."luks-c42416f3-d1ce-4a19-853e-9751e5792d69".device = "/dev/disk/by-uuid/c42416f3-d1ce-4a19-853e-9751e5792d69";
  networking.hostName = "nixos";

  networking.networkmanager.enable = true;
  networking.enableIPv6 = false;
  networking.firewall.checkReversePath = "loose"; # tailscale exit nodes fix
  services.tailscale.useRoutingFeatures = "client";

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  time.timeZone = "Europe/Moscow";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];
  services.flatpak.enable = true;

  services.xserver.enable = true;

  # comment this if you don't use KDE
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  services.xserver.desktopManager.xfce = {
    enable = true;
    enableWaylandSession = true;
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = [ pkgs.intel-media-driver pkgs.intel-vaapi-driver ];
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
  };

  services.libinput.enable = true;

  programs.fish.enable = true;

  users.users.forkd = {
    isNormalUser = true;
    description = "fork";
    shell = pkgs.fish;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  services.logind = {
    settings.Login = {
      IdleAction = "ignore";
      IdleActionSec = 0;
      HandleLidSwitch = "ignore";
    };
  };

  fonts = {
    packages = with pkgs; [
      pkgs.nerd-fonts.jetbrains-mono
      pkgs.nerd-fonts.symbols-only
      pkgs.poppins
    ];
  };

  # services.tailscale.enable = true;
  programs.amnezia-vpn.enable = true;

  services.slskd = {
    enable = true;
    environmentFile = "/etc/slskd/env";
    settings = {
      directories = {
        downloads = "/etc/slskd/downloads";
	incomplete = "/etc/slskd/downloads/incomplete";
      };
    };
  };

  services.navidrome = {
    enable = true;
    settings = {
      MusicFolder = "/opt/navidrome/music";
      PlaylistsPath = "/opt/navidrome/playlists";
      EnableSharing = true;
    };
  };

  programs.firefox.enable = true;

  nixpkgs.config.allowUnfree = true;

  boot.supportedFilesystems = [ "ntfs" ];

#  services.minecraft-server = {
#    enable = true;
#    eula = true;
#    openFirewall = true;
#    package = pkgs.papermcServers.papermc-1_21_11;
#    serverProperties = {
#      difficulty = 2;
#      gamemode = 0;
#      max-players = 3;
#      enable-rcon = true;
#      "rcon.password" = "fuckinghell";
#      white-list = true;
#      motd = "super cool local server";
#    };
#    whitelist = {
#      forkd_owo = "9993ba3a-9b23-4029-bcd5-7d15a978ec71";
#    };
#  };

  programs.niri.enable = true;
  programs.hyprland.enable = true; # temporary for learning QS... proooobably...
  environment.systemPackages = with pkgs; [
    adwaita-icon-theme
    brightnessctl
    playerctl
    quickshell
    xwayland-satellite
    python3
    neovim
    tree
    wget
    trayscale
    git
    bluetui
    gnumake
    cmake
    swaynotificationcenter
    p7zip
    btop
    croc
    ddcutil
    fd
    flatpak
    fzf
    gnupg
    htop
    lsof
    nautilus
    pavucontrol
    pick
    ripgrep
    socat
    strace
    tmux
    traceroute
    jdk21
    jdk25
    nodejs_22
    docker
    docker-compose
  ];

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  system.stateVersion = "25.11";
}
