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
  networking.firewall.checkReversePath = "loose"; # tailscale exit nodes fix
  services.tailscale.useRoutingFeatures = "client";

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  time.timeZone = "Europe/Moscow";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];
  services.flatpak.enable = true;

  services.xserver.enable = true;

  # comment this if you don't use KDE
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

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

  fonts = {
    packages = with pkgs; [
      pkgs.nerd-fonts.jetbrains-mono
      pkgs.nerd-fonts.symbols-only
    ];
  };

  services.tailscale.enable = true;

  programs.firefox.enable = true;

  nixpkgs.config.allowUnfree = true;

  boot.supportedFilesystems = [ "ntfs" ];

  programs.niri.enable = true;
  environment.systemPackages = with pkgs; [
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
