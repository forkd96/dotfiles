{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # networking.firewall.enable = true;

  networking.hostName = "nixos";

  time.timeZone = "Europe/Moscow";
  i18n.defaultLocale = "en_US.UTF-8";

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  users.users.forkd = {
    isNormalUser = true;
    description = "fork";
    shell = pkgs.fish;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;
  
  nixpkgs.config.permittedInsecurePackages = [
    "olm-3.2.16"
  ];

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # services.tailscale.enable = true;
  programs.amnezia-vpn.enable = true;
  services.flatpak.enable = true;


  services.navidrome = {
    enable = true;
    settings = {
      MusicFolder = "/opt/navidrome/music";
      PlaylistsPath = "/opt/navidrome/playlists";
      EnableSharing = true;
    };
  };

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

  programs.steam = { enable = true; remotePlay.openFirewall = true; };
  programs.fish.enable = true;
  programs.niri.enable = true;
  programs.firefox.enable = true;

  fonts = {
    packages = with pkgs; [
      pkgs.nerd-fonts.jetbrains-mono
      pkgs.nerd-fonts.symbols-only
      pkgs.poppins
      pkgs.fira
    ];
  };

  environment.systemPackages = with pkgs; [
    adwaita-icon-theme
    brightnessctl
    playerctl
    xwayland-satellite
    polkit_gnome
    dex
    python3
    neovim
    tree
    wget
    git
    bluetui
    gnumake
    cmake
    swaynotificationcenter
    p7zip
    btop
    ddcutil
    fd
    flatpak
    fzf
    gnupg
    htop
    lsof
    pavucontrol
    pick
    ripgrep
    socat
    traceroute
    jdk21
    jdk25
    docker
    docker-compose
  ];

  # *** all the mostly static stuff i change once in a blue moon ***

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

  networking.networkmanager.enable = true;
  networking.enableIPv6 = false;

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  services.gnome.gnome-keyring.enable = true;
  security.pam.services.login.enableGnomeKeyring = true;

  services.udisks2.enable = true;
  services.gvfs.enable = true;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };

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

  services.libinput.enable = true;

  services.logind = {
    settings.Login = {
      IdleAction = "ignore";
      IdleActionSec = 0;
      HandleLidSwitch = "ignore";
    };
  };


  # --- ---

  system.stateVersion = "25.11";
}
