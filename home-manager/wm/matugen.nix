{ config, ... }: {
  xdg.configFile."matugen/config.toml".text = ''
    [config.wallpaper]
    command = "awww"
    arguments = ["img", "--transition-type", "random"]
    set = true

    [config]
    scheme = "scheme-expressive"

    [templates.waybar]
    input_path = "${config.xdg.configHome}/matugen/templates/colors.css"
    output_path = "${config.xdg.configHome}/waybar/colors.css"
    post_hook = "pkill -SIGUSR2 waybar"

    [templates.quickshell_colors]
    input_path = "~/.config/matugen/templates/colors.qml"
    output_path = "~/.config/quickshell/colors/Colors.qml"
  '';

  xdg.configFile."matugen/templates/colors.css".text = ''
    /*
    * Css Colors
    * Generated with Matugen
    */
    <* for name, value in colors *>
        @define-color {{name}} {{value.default.hex}};
    <* endfor *>
  '';
}
