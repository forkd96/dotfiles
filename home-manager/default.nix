{ ... }: {
  imports = [ ./fish.nix ./kitty.nix ./nvim.nix ./wm/niri.nix ./wm/waybar.nix ./apps.nix ./fastfetch.nix ];
  home.username = "forkd";
  home.homeDirectory = "/home/forkd";
  home.stateVersion = "25.11";
}
