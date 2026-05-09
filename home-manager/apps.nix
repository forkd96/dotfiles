{ pkgs, pkgs-stable, inputs, ... }:

{ 
  home = {
    packages = with pkgs; [
      inputs.matugen.packages.${system}.default
      pywalfox-native
      kitty
      thunar
      eza
      bat
      awww
      fsel
      kdePackages.gwenview

      yazi
      exiftool
      mediainfo

      prismlauncher
      easyeffects
      kdePackages.elisa
      kdePackages.kdeconnect-kde
      librewolf
      heroic
      obs-studio
      qbittorrent
      vscodium
      cinny
      vlc
      redact
      feishin
      insomnia
      lmms
      ayugram-desktop
      fluffychat

      catppuccin-qt5ct
      glib
      adw-gtk3
      
      kid3
    ];
  };
}
