{ pkgs, pkgs-stable, inputs, ... }:

{ 
  home = {
    packages = with pkgs; [
      inputs.matugen.packages.${system}.default
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
      krita

      catppuccin-kde
      catppuccin-qt5ct
    ];
  };
}
