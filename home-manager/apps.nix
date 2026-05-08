{ pkgs, pkgs-stable, inputs, ... }:

{ 
  home = {
    packages = with pkgs; [
      inputs.matugen.packages.${system}.default
      hello
      kitty
      ghostty
      kdePackages.dolphin
      eza
      bat
      kitty-themes
      gpu-screen-recorder
      awww
      fsel
      wlogout

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
