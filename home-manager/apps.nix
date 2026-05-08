{ pkgs, pkgs-stable, inputs, ... }:

{ 
  home = {
    packages = with pkgs; [
      inputs.matugen.packages.${system}.default
      pywalfox-native
      kitty
      ghostty
      xfce.thunar
      eza
      bat
      kitty-themes
      gpu-screen-recorder
      awww
      fsel
      wlogout
      kdePackages.gwenview

      prismlauncher
      easyeffects
      gajim
      kdePackages.kdeconnect-kde
      librewolf
      heroic
      obs-studio
      qbittorrent
      nicotine-plus
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
      
      kid3
    ];
  };
}
