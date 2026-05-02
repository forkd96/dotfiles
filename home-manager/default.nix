{ ... }: {
  imports = [ ./fish.nix ./kitty.nix ./nvim.nix ./wm/niri.nix ./wm/waybar.nix ./apps.nix ./fastfetch.nix ./wm/otter-launcher.nix ./wm/matugen.nix ./wm/swaync.nix ./vesktop.nix ];
  home.username = "forkd";
  home.homeDirectory = "/home/forkd";
  home.stateVersion = "25.11";

  xdg.userDirs.createDirectories = true;
}
