<div align="center">

# Fork's shitty dotfiles

</div>

## Details
### Desktop
- OS: [NixOS](https://nixos.org/)
- WM: [niri](https://github.com/niri-wm/niri)
- Bar: [waybar](https://github.com/Alexays/Waybar)
- App launcher: [fsel](https://github.com/Mjoyufull/fsel), [otter-launcher](https://github.com/kuokuo123/otter-launcher)
- Wallpaper switcher: [matuwall](https://github.com/naurissteins/Matuwall)

### Terminal
- Terminal: [kitty](https://github.com/kovidgoyal/kitty)
- Fetch: [fastfetch](https://github.com/fastfetch-cli/fastfetch)
- Shell: [fish](https://github.com/fish-shell/fish-shell)
- Prompt: [tide](https://github.com/IlanCosman/tide)
- Notifications: [swaync](https://github.com/ErikReider/SwayNotificationCenter)

### Themes / Fonts
- Color scheme: [Catppuccin Macchiato](https://catppuccin.com/palette/) (primary color is blue / mauve in some places)
- Wallpapers: [orangci/walls-catppuccin-mocha](https://github.com/orangci/walls-catppuccin-mocha)
- Font: JetBrainsMono Nerd Font
- GTK theme: [Catppuccin by Fausto-Korpsvart](https://github.com/Fausto-Korpsvart/Catppuccin-GTK-Theme)

- All other app themes: [Catppuccin ports](https://catppuccin.com/ports/)

## Installation 
### NixOS:
> [!WARNING]  
> This will overwrite your existing configuration.nix file. Though, the script backs up /etc/nixos and we're talking about NixOS so you can just roll back at any time.

```shell
sudo nixos-generate-config --show-hardware-config > /tmp/hardware-configuration.nix
nix-shell -p git --run "git clone https://codeberg.org/forkd/dotfiles ~/dotfiles"
cp /tmp/hardware-configuration.nix ~/dotfiles/nixos/hardware-configuration.nix
sudo mv /etc/nixos /etc/nixos.bak
sudo ln -sf /home/$USER/dotfiles /etc/nixos
sudo nixos-rebuild switch
```

### Other distros:
- Just drop in stuff from .config in the repo's root into your actual ~/.config and you're golden. .config may be outdated compared to HM though, because i mainly use home manager