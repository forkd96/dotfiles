{ pkgs, pkgs-stable, ... }:

{ 
  home = {
    packages = with pkgs; [
      hello
      kitty
      ghostty
      eza
      bat
      kitty-themes
      gpu-screen-recorder
      awww
      fsel

      prismlauncher
      easyeffects
      gajim
      librewolf
      lutris
      obs-studio
      qbittorrent
      vscodium
      cinny

      catppuccin-kde
      catppuccin-qt5ct
    ];
  };
}
