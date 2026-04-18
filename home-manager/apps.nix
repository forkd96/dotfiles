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
      fastfetch
      gpu-screen-recorder
      awww

      prismlauncher
      easyeffects
      gajim
      librewolf
      lutris
      obs-studio
      qbittorrent
      steam
      vscodium
      cinny

      catppuccin-kde
      catppuccin-qt5ct
    ];
  };
}
