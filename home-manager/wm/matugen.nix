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

    [templates.swaync]
    input_path = "${config.xdg.configHome}/matugen/templates/colors.css"
    output_path = "${config.xdg.configHome}/swaync/colors.css"
    post_hook = "swaync-client -rs"

    [templates.matuwall]
    input_path = '${config.xdg.configHome}/matugen/templates/matuwall-colors.json'
    output_path = '${config.xdg.configHome}/matuwall/colors.json'

    # no matter what scheme, saturation, color overrides or templates i use it always ends up generating straight bullshit, i don't really wanna babysit it, feel free to open a pr if you have a good template tho
    [templates.kitty]
    input_path = "${config.xdg.configHome}/matugen/templates/kitty-colors.conf"
    output_path = "${config.xdg.configHome}/kitty/current-theme.conf"
    post_hook = "pkill -USR1 kitty"
    
    [templates.qt5ct]
    input_path = "${config.xdg.configHome}/matugen/templates/qtct-colors.conf"
    output_path = "${config.xdg.configHome}/qt5ct/colors/matugen.conf"

    [templates.qt6ct]
    input_path = "${config.xdg.configHome}/matugen/templates/qtct-colors.conf"
    output_path = "${config.xdg.configHome}/qt6ct/colors/matugen.conf"

    [templates.niri]
    input_path = "${config.xdg.configHome}/matugen/templates/niri-colors.kdl"
    output_path = "${config.xdg.configHome}/niri/colors.kdl"
    post_hook = "niri msg action load-config-file"

    [templates.nvim]
    input_path = "${config.xdg.configHome}/matugen/templates/nvim-colors.lua"
    output_path = "${config.xdg.configHome}/nvim/colors/colors.vim"
    post_hook = "pkill -SIGUSR1 nvim"

    [templates.btop]
    input_path = "${config.xdg.configHome}/matugen/templates/btop.theme"
    output_path = "${config.xdg.configHome}/btop/themes/colors.theme"
    post_hook = "pkill -USR2 btop || true"

    [templates.cava]
    input_path = "${config.xdg.configHome}/matugen/templates/cava-colors.ini"
    output_path = "${config.xdg.configHome}/cava/colors.ini"
    post_hook = "pkill -USR1 cava"

    [templates.wlogout]
    input_path = '${config.xdg.configHome}/matugen/templates/colors.css'
    output_path = '${config.xdg.configHome}/wlogout/colors.css'
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

  xdg.configFile."qt5ct/qt5ct.conf".text = ''
    [Appearance]
    color_scheme_path=${config.xdg.configHome}/qt5ct/colors/matugen.conf
    custom_palette=true
    color_scheme_path=~/.local/share/color-schemes/Matugen.colors
    custom_palette=true
    icon_theme=breeze
    style=Breeze
  '';
}
