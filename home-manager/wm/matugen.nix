{ config, ... }:

{
  xdg.configFile = {

    # *** matugen config ***

    "matugen/config.toml".text = ''
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

#      [templates.matuwall]
#      input_path = '${config.xdg.configHome}/matugen/templates/matuwall-colors.json'
#      output_path = '${config.xdg.configHome}/matuwall/colors.json'

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

    # *** templates ***   

    "matugen/templates/btop.theme".text = ''
      # Matugen template for btop


      # Colors should be in 6 or 2 character hexadecimal or single spaced rgb decimal: "#RRGGBB", "#BW" or "0-255 0-255 0-255"
      # example for white: "#ffffff", "#ff" or "255 255 255".

      # All graphs and meters can be gradients
      # For single color graphs leave "mid" and "end" variable empty.
      # Use "start" and "end" variables for two color gradient
      # Use "start", "mid" and "end" for three color gradient

      # Main background, empty for terminal default, need to be empty if you want transparent background
      theme[main_bg]=""

      # Main text color
      theme[main_fg]="{{colors.on_surface.default.hex}}"

      # Title color for boxes
      theme[title]="{{colors.primary.default.hex}}"

      # Highlight color for keyboard shortcuts
      theme[hi_fg]="{{colors.secondary.default.hex}}"

      # Background color of selected item in processes box
      theme[selected_bg]="{{colors.primary.default.hex}}"

      # Foreground color of selected item in processes box
      theme[selected_fg]="{{colors.on_primary.default.hex}}"

      # Color of inactive/disabled text
      theme[inactive_fg]="{{colors.on_surface_variant.default.hex}}"

      # Misc colors for processes box including mini cpu graphs, details memory graph and details status text
      theme[proc_misc]="{{colors.tertiary.default.hex}}"

      # Cpu box outline color
      theme[cpu_box]="{{colors.outline.default.hex}}"

      # Memory/disks box outline color
      theme[mem_box]="{{colors.outline.default.hex}}"

      # Net up/down box outline color
      theme[net_box]="{{colors.outline.default.hex}}"

      # Processes box outline color
      theme[proc_box]="{{colors.outline.default.hex}}"

      # Box divider line and small boxes line color
      theme[div_line]="{{colors.outline_variant.default.hex}}"

      # Temperature graph colors
      theme[temp_start]="{{colors.secondary.default.hex}}"
      theme[temp_mid]="{{colors.primary.default.hex}}"
      theme[temp_end]="{{colors.error.default.hex}}"

      # CPU graph colors
      theme[cpu_start]="{{colors.secondary.default.hex}}"
      theme[cpu_mid]="{{colors.primary.default.hex}}"
      theme[cpu_end]="{{colors.error.default.hex}}"

      # Mem/Disk free meter
      theme[free_start]="{{colors.secondary.default.hex}}"
      theme[free_mid]=""
      theme[free_end]="{{colors.secondary_container.default.hex}}"

      # Mem/Disk cached meter
      theme[cached_start]="{{colors.tertiary.default.hex}}"
      theme[cached_mid]=""
      theme[cached_end]="{{colors.tertiary_container.default.hex}}"

      # Mem/Disk available meter
      theme[available_start]="{{colors.primary.default.hex}}"
      theme[available_mid]=""
      theme[available_end]="{{colors.primary_container.default.hex}}"

      # Mem/Disk used meter
      theme[used_start]="{{colors.error.default.hex}}"
      theme[used_mid]=""
      theme[used_end]="{{colors.error_container.default.hex}}"

      # Download graph colors
      theme[download_start]="{{colors.secondary.default.hex}}"
      theme[download_mid]="{{colors.primary.default.hex}}"
      theme[download_end]="{{colors.tertiary.default.hex}}"

      # Upload graph colors
      theme[upload_start]="{{colors.secondary.default.hex}}"
      theme[upload_mid]="{{colors.primary.default.hex}}"
      theme[upload_end]="{{colors.tertiary.default.hex}}"
    '';

    "matugen/templates/cava-colors.ini".text = ''
      [color]
      background = 'default'
      foreground = '{{colors.primary.default.hex}}'

      ; gradient = 0
      gradient = 1
      gradient_color_1 = '{{colors.primary_container.default.hex}}'
      gradient_color_2 = '{{colors.primary.default.hex}}'
      gradient_color_3 = '{{colors.on_primary_container.default.hex}}'

      horizontal_gradient = 0
      ; horizontal_gradient = 1
      horizontal_gradient_color_1 = '{{colors.primary_container.default.hex}}'
      horizontal_gradient_color_2 = '{{colors.primary.default.hex}}'
      horizontal_gradient_color_3 = '{{colors.on_primary_container.default.hex}}'
      horizontal_gradient_color_4 = '{{colors.primary.default.hex}}'
      horizontal_gradient_color_5 = '{{colors.primary_container.default.hex}}'
    '';

    "matugen/templates/colors.css".text = ''
      /*
      * Css Colors
      * Generated with Matugen
      */
      <* for name, value in colors *>
          @define-color {{name}} {{value.default.hex}};
      <* endfor *>
    '';

    "matugen/templates/kitty-colors.conf".text = ''
      <* if {{ is_dark_mode }} *>
      # vim:ft=kitty
      
      ## name:     Catppuccin Kitty Macchiato
      ## author:   Catppuccin Org
      ## license:  MIT
      ## upstream: https://github.com/catppuccin/kitty/blob/main/themes/macchiato.conf
      ## blurb:    Soothing pastel theme for the high-spirited!
      
      
      
      # The basic colors
      foreground              #cad3f5
      background              #24273a
      selection_foreground    #24273a
      selection_background    #f4dbd6
      
      # Cursor colors
      cursor                  #f4dbd6
      cursor_text_color       #24273a
      
      # Scrollbar colors
      scrollbar_handle_color  #939ab7
      scrollbar_track_color   #494d64
      
      # URL color when hovering with mouse
      url_color               #f4dbd6
      
      # Kitty window border colors
      active_border_color     #b7bdf8
      inactive_border_color   #6e738d
      bell_border_color       #eed49f
      
      # OS Window titlebar colors
      wayland_titlebar_color system
      macos_titlebar_color system
      
      # Tab bar colors
      active_tab_foreground   #181926
      active_tab_background   #c6a0f6
      inactive_tab_foreground #cad3f5
      inactive_tab_background #1e2030
      tab_bar_background      #181926
      
      # Colors for marks (marked text in the terminal)
      mark1_foreground #24273a
      mark1_background #b7bdf8
      mark2_foreground #24273a
      mark2_background #c6a0f6
      mark3_foreground #24273a
      mark3_background #7dc4e4
      
      # The 16 terminal colors
      
      # black
      color0 #494d64
      color8 #5b6078
      
      # red
      color1 #ed8796
      color9 #ed8796
      
      # green
      color2  #a6da95
      color10 #a6da95
      
      # yellow
      color3  #eed49f
      color11 #eed49f
      
      # blue
      color4  #8aadf4
      color12 #8aadf4
      
      # magenta
      color5  #f5bde6
      color13 #f5bde6
      
      # cyan
      color6  #8bd5ca
      color14 #8bd5ca
      
      # white
      color7  #b8c0e0
      color15 #a5adcb
      <* else *>
      # vim:ft=kitty

      ## name:     Catppuccin Kitty Latte
      ## author:   Catppuccin Org
      ## license:  MIT
      ## upstream: https://github.com/catppuccin/kitty/blob/main/themes/latte.conf
      ## blurb:    Soothing pastel theme for the high-spirited!
      
      
      
      # The basic colors
      foreground              #4c4f69
      background              #eff1f5
      selection_foreground    #eff1f5
      selection_background    #dc8a78
      
      # Cursor colors
      cursor                  #dc8a78
      cursor_text_color       #eff1f5
      
      # Scrollbar colors
      scrollbar_handle_color  #7c7f93
      scrollbar_track_color   #bcc0cc
      
      # URL color when hovering with mouse
      url_color               #dc8a78
      
      # Kitty window border colors
      active_border_color     #7287fd
      inactive_border_color   #9ca0b0
      bell_border_color       #df8e1d
      
      # OS Window titlebar colors
      wayland_titlebar_color system
      macos_titlebar_color system
      
      # Tab bar colors
      active_tab_foreground   #eff1f5
      active_tab_background   #8839ef
      inactive_tab_foreground #4c4f69
      inactive_tab_background #9ca0b0
      tab_bar_background      #bcc0cc
      
      # Colors for marks (marked text in the terminal)
      mark1_foreground #eff1f5
      mark1_background #7287fd
      mark2_foreground #eff1f5
      mark2_background #8839ef
      mark3_foreground #eff1f5
      mark3_background #209fb5
      
      # The 16 terminal colors
      
      # black
      color0 #5c5f77
      color8 #6c6f85
      
      # red
      color1 #d20f39
      color9 #d20f39
      
      # green
      color2  #40a02b
      color10 #40a02b
      
      # yellow
      color3  #df8e1d
      color11 #df8e1d
      
      # blue
      color4  #1e66f5
      color12 #1e66f5
      
      # magenta
      color5  #ea76cb
      color13 #ea76cb
      
      # cyan
      color6  #179299
      color14 #179299
      
      # white
      color7  #acb0be
      color15 #bcc0cc
      <* endif *>
    '';

    "matugen/templates/niri-colors.kdl".text = ''
      layout {
          focus-ring {
              active-color "{{colors.primary.default.hex}}"
              inactive-color "{{colors.outline.default.hex}}"
              urgent-color   "{{colors.error.default.hex}}"
          }

          border {
              active-color   "{{colors.primary.default.hex}}"
              inactive-color "{{colors.outline.default.hex}}"
              urgent-color   "{{colors.error.default.hex}}"
          }

          shadow {
              color "{{colors.shadow.default.hex}}70"
          }

          tab-indicator {
              active-color   "{{colors.primary.default.hex}}"
              inactive-color "{{colors.outline.default.hex}}"
              urgent-color   "{{colors.error.default.hex}}"
          }

          insert-hint {
              color "{{colors.primary.default.hex}}80"
          }
      }

      overview {
          backdrop-color "{{colors.background.default.hex}}"
      }
    '';

    "matugen/templates/nvim-colors.lua".text = ''
      -- Generated by Matugen

      require('base16-colorscheme').setup({
        base00 = "{{colors.background.default.hex}}",
        base01 = "{{colors.surface_container_lowest.default.hex}}",
        base02 = "{{colors.surface_container_low.default.hex}}",
        base03 = "{{colors.outline_variant.default.hex}}",
        base04 = "{{colors.on_surface_variant.default.hex}}",
        base05 = "{{colors.on_surface.default.hex}}",
        base06 = "{{colors.inverse_on_surface.default.hex}}",
        base07 = "{{colors.surface_bright.default.hex}}",

        base08 = "{{colors.tertiary.default.hex | lighten: -5}}",
        base09 = "{{colors.tertiary.default.hex}}",
        base0A = "{{colors.secondary.default.hex}}",
        base0B = "{{colors.primary.default.hex}}",
        base0C = "{{colors.tertiary_container.default.hex}}",
        base0D = "{{colors.primary_container.default.hex}}",
        base0E = "{{colors.secondary_container.default.hex}}",
        base0F = "{{colors.secondary.default.hex | lighten: -10}}",
      })


      -- We first theme base16, but we also need to fix some other colors that don't
      -- contrast well by default

      -- Helper function to set multiple highlight groups at once
      local function set_hl_mutliple(groups, value)
        for _, v in pairs(groups) do
          vim.api.nvim_set_hl(0, v, value)
        end
      end

      -- Make selected text stand out more
      vim.api.nvim_set_hl(0, 'Visual', {
        bg = '{{colors.primary_container.default.hex}}',
        fg = '{{colors.on_primary_container.default.hex}}', -- normal text contrast
      })

      -- Make "string" text contrast better
      set_hl_mutliple({ 'String', 'TSString' }, {
        fg = '{{colors.tertiary.default.hex | lighten: -15.0 }}',
      })

      -- Grey out comments
      set_hl_mutliple({ 'TSComment', 'Comment' }, {
        fg = '{{colors.outline.default.hex}}',
        italic = true,
      })

      -- Color in other highlight groups as you see fit!

      set_hl_mutliple({ 'TSMethod', 'Method' }, {
        fg = '{{colors.tertiary.default.hex}}',
      })


      set_hl_mutliple({ 'TSFunction', 'Function' }, {
        fg = '{{colors.secondary.default.hex}}',
      })

      set_hl_mutliple({ 'Keyword', 'TSKeyword', 'TSKeywordFunction', 'TSRepeat' }, {
        fg = '{{colors.inverse_primary.default.hex}}',
      })
    '';

    "matugen/templates/qtct-colors.conf".text = ''
      [ColorScheme]
      active_colors={{colors.on_background.default.hex}}, {{colors.surface.default.hex}}, #ffffff, #cacaca, #9f9f9f, #b8b8b8, {{colors.on_background.default.hex}}, #ffffff, {{colors.on_surface.default.hex}}, {{colors.background.default.hex}}, {{colors.background.default.hex}}, {{colors.shadow.default.hex}}, {{colors.primary_container.default.hex}}, {{colors.on_primary_container.default.hex}}, {{colors.secondary.default.hex}}, {{colors.primary.default.hex}}, {{colors.surface.default.hex}}, {{colors.scrim.default.hex}}, {{colors.surface.default.hex}}, {{colors.on_surface.default.hex}}, {{colors.secondary.default.hex}}
      disabled_colors={{colors.on_background.default.hex}}, {{colors.surface.default.hex}}, #ffffff, #cacaca, #9f9f9f, #b8b8b8, {{colors.on_background.default.hex}}, #ffffff, {{colors.on_surface.default.hex}}, {{colors.background.default.hex}}, {{colors.background.default.hex}}, {{colors.shadow.default.hex}}, {{colors.primary_container.default.hex}}, {{colors.on_primary_container.default.hex}}, {{colors.secondary.default.hex}}, {{colors.primary.default.hex}}, {{colors.surface.default.hex}}, {{colors.scrim.default.hex}}, {{colors.surface.default.hex}}, {{colors.on_surface.default.hex}}, {{colors.secondary.default.hex}}
      inactive_colors={{colors.on_background.default.hex}}, {{colors.surface.default.hex}}, #ffffff, #cacaca, #9f9f9f, #b8b8b8, {{colors.on_background.default.hex}}, #ffffff, {{colors.on_surface.default.hex}}, {{colors.background.default.hex}}, {{colors.background.default.hex}}, {{colors.shadow.default.hex}}, {{colors.primary_container.default.hex}}, {{colors.on_primary_container.default.hex}}, {{colors.secondary.default.hex}}, {{colors.primary.default.hex}}, {{colors.surface.default.hex}}, {{colors.scrim.default.hex}}, {{colors.surface.default.hex}}, {{colors.on_surface.default.hex}}, {{colors.secondary.default.hex}}
    '';

    "qt5ct/qt5ct.conf".text = ''
      [Appearance]
      color_scheme_path=${config.xdg.configHome}/qt5ct/colors/matugen.conf
      custom_palette=true
      color_scheme_path=~/.local/share/color-schemes/Matugen.colors
      custom_palette=true
      icon_theme=breeze
      style=Breeze
    '';

  };
}
