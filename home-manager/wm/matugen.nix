{ config, ... }:

{

  # *** helper script ***
  home.file."${config.home.homeDirectory}/.local/bin/matugen-mode-sync" = {
    executable = true;
    text = ''
      #!/usr/bin/env bash
      case "$1" in
        dark)  dconf write /org/gnome/desktop/interface/color-scheme "'prefer-dark'" ;;
        light) dconf write /org/gnome/desktop/interface/color-scheme "'prefer-light'" ;;
      esac
    '';
  };

  xdg.configFile = {

    # *** matugen config ***

    "matugen/config.toml".text = ''
      [config.wallpaper]
      command = "awww"
      arguments = ["img", "--transition-type", "random"]
      set = true

      [config]
      scheme = "scheme-expressive"

      [templates.system_theme]
      input_path  = "${config.xdg.configHome}/matugen/templates/system-theme.txt"
      output_path = "/tmp/matugen-mode"
      post_hook   = "${config.home.homeDirectory}/.local/bin/matugen-mode-sync {{ mode }}"

      [templates.waybar]
      input_path = "${config.xdg.configHome}/matugen/templates/colors.css"
      output_path = "${config.xdg.configHome}/waybar/colors.css"
      post_hook = "pkill -SIGUSR2 waybar"

      [templates.pywalfox]
      input_path = '${config.xdg.configHome}/matugen/templates/pywalfox-colors.json'
      output_path = '${config.home.homeDirectory}/.cache/wal/colors.json'
      post_hook = 'pywalfox update'

      [templates.vesktop]
      input_path = '${config.xdg.configHome}/matugen/templates/midnight-discord.css'
      output_path = '${config.xdg.configHome}/vesktop/themes/midnight-discord.css'

      [templates.swaync]
      input_path = "${config.xdg.configHome}/matugen/templates/colors.css"
      output_path = "${config.xdg.configHome}/swaync/colors.css"
      post_hook = "swaync-client -rs"

#      unsused for now
#      [templates.matuwall]
#      input_path = '${config.xdg.configHome}/matugen/templates/matuwall-colors.json'
#      output_path = '${config.xdg.configHome}/matuwall/colors.json'

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

    "matugen/templates/system-theme.txt".text = ''
      {{ mode }}
    '';

    "matugen/templates/pywalfox-colors.json".text = ''
      {
        "wallpaper": "{{image}}",
        "alpha": "100",
        "colors": {
          "color0": "{{colors.surface.dark.hex}}",
          "color1": "",
          "color2": "",
          "color3": "{{colors.primary.default.hex}}",
          "color4": "",
          "color5": "{{colors.secondary.default.hex}}",
          "color6": "",
          "color7": "{{colors.surface_container_highest.default.hex}}",
          "color8": "",
          "color9": "",
          "color10": "{{colors.primary.default.hex}}",
          "color11": "",
          "color12": "",
          "color13": "{{colors.secondary.default.hex}}",
          "color14": "",
          "color15": "{{colors.on_background.default.hex}}"
        }
      }
    '';

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
      cursor {{colors.on_surface.default.hex}}
      cursor_text_color {{colors.on_surface_variant.default.hex}}
      
      foreground            {{colors.on_surface.default.hex}}
      background            {{colors.surface.default.hex}}
      selection_foreground  {{colors.on_secondary.default.hex}}
      selection_background  {{colors.secondary_fixed_dim.default.hex}}
      url_color             {{colors.primary.default.hex}}

      # black
      color8   #262626
      color0   #4c4c4c
      
      # red
      color1   #ac8a8c
      color9   #c49ea0
      
      # green
      color2   #8aac8b
      color10  #9ec49f
      
      # yellow
      color3   #aca98a
      color11  #c4c19e
      
      # blue
      color4  {{colors.primary.default.hex}}
      color12 #a39ec4
      
      # magenta
      color5   #ac8aac
      color13  #c49ec4
      
      # cyan
      color6   #8aacab
      color14  #9ec3c4
      
      # white
      color15   #e7e7e7
      color7  #f0f0f0   
      <* else *>
      cursor {{colors.on_surface.light.hex}}
      cursor_text_color {{colors.on_surface_variant.light.hex}}
      
      foreground            {{colors.on_surface.light.hex}}
      background            {{colors.surface.light.hex}}
      selection_foreground  {{colors.on_secondary.light.hex}}
      selection_background  {{colors.secondary_fixed_dim.light.hex}}
      url_color             {{colors.primary.light.hex}}

      # black
      color8   #262626
      color0   #4c4c4c
      
      # red
      color1   #ac8a8c
      color9   #c49ea0
      
      # green
      color2   #8aac8b
      color10  #9ec49f
      
      # yellow
      color3   #aca98a
      color11  #c4c19e
      
      # blue
      color4  {{colors.primary.default.hex}}
      color12 #a39ec4
      
      # magenta
      color5   #ac8aac
      color13  #c49ec4
      
      # cyan
      color6   #8aacab
      color14  #9ec3c4
      
      # white
      color15   #e7e7e7
      color7  #f0f0f0   
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

    "matugen/templates/midnight-discord.css".text = ''
      /**
       * @name midnight
       * @description A dark, rounded discord theme.
       * @author refact0r
       * @version 1.6.2
       * @invite nz87hXyvcy
       * @website https://github.com/refact0r/midnight-discord
       * @source https://github.com/refact0r/midnight-discord/blob/master/midnight.theme.css
       * @authorId 508863359777505290
       * @authorLink https://www.refact0r.dev
      */
      
      /* IMPORTANT: make sure to enable dark mode in discord settings for the theme to apply properly!!! */
      
      @import url('https://refact0r.github.io/midnight-discord/build/midnight.css');
      
      /* customize things here */
      :root {
      	/* font, change to 'gg sans' for default discord font*/
      	--font: 'figtree';
      
      	/* top left corner text */
      	--corner-text: 'Midnight';
      
      	/* color of status indicators and window controls */
          --online-indicator: {{colors.inverse_primary.default.hex}};     /* change to #23a55a for default green */
      	--dnd-indicator: {{colors.error.default.hex}};                  /* change to #f13f43 for default red */
      	--idle-indicator: {{colors.tertiary_container.default.hex}};    /* change to #f0b232 for default yellow */
      	--streaming-indicator: {{colors.on_primary.default.hex}};       /* change to #593695 for default purple */
      
      	/* accent colors */
          --accent-1: {{colors.tertiary.default.hex}};            /* links */
      	--accent-2: {{colors.primary.default.hex}};             /* general unread/mention elements, some icons when active */
      	--accent-3: {{colors.primary.default.hex}};             /* accent buttons */
      	--accent-4: {{colors.surface_bright.default.hex}};      /* accent buttons when hovered */
      	--accent-5: {{colors.primary_fixed_dim.default.hex}};   /* accent buttons when clicked */
          --accent-new: {{colors.inverse_primary.default.hex}};   /* user panel mute & deafen buttons */
      	--mention:  {{colors.surface.default.hex}};             /* mentions & mention messages */
      	--mention-hover: {{colors.surface_bright.default.hex}}; /* mentions & mention messages when hovered */
      
      	/* text colors */
      	--text-0: {{colors.surface.default.hex}};               /* text on colored elements */
      	--text-1: {{colors.on_surface.default.hex}};            /* other normally white text */
      	--text-2: {{colors.on_surface.default.hex}};            /* headings and important text */
      	--text-3: {{colors.on_surface_variant.default.hex}};    /* normal text */
      	--text-4: {{colors.on_surface_variant.default.hex}};    /* icon buttons and channels */
      	--text-5: {{colors.outline.default.hex}};               /* muted channels/chats and timestamps */
      
      	/* background and dark colors */
          --bg-1: {{colors.surface_variant.default.hex}};                             /* dark buttons when clicked */
      	--bg-2: {{colors.surface_container_high.default.hex}};              /* dark buttons */
      	--bg-3: {{colors.surface_container_low.default.hex}};               /* spacing, secondary elements */
      	--bg-4: {{colors.surface.default.hex}};                             /* main background color */
      	--hover: {{colors.surface_bright.default.hex}};                     /* channels and buttons when hovered */
      	--active: {{colors.surface_bright.default.hex}};                    /* channels and buttons when clicked or selected */
      	--message-hover: {{colors.surface_bright.default.hex}};             /* messages when hovered */
      
      	/* amount of spacing and padding */
      	--spacing: 12px;
      
      	/* animations */
      	/* ALL ANIMATIONS CAN BE DISABLED WITH REDUCED MOTION IN DISCORD SETTINGS */
      	--list-item-transition: 0.2s ease;  /* channels/members/settings hover transition */
      	--unread-bar-transition: 0.2s ease; /* unread bar moving into view transition */
      	--moon-spin-transition: 0.4s ease;  /* moon icon spin */
      	--icon-spin-transition: 1s ease;    /* round icon button spin (settings, emoji, etc.) */
      
      	/* corner roundness (border-radius) */
      	--roundness-xl: 22px; /* roundness of big panel outer corners */
      	--roundness-l: 20px; /* popout panels */
      	--roundness-m: 16px; /* smaller panels, images, embeds */
      	--roundness-s: 12px; /* members, settings inputs */
      	--roundness-xs: 10px; /* channels, buttons */
      	--roundness-xxs: 8px; /* searchbar, small elements */
      
      	/* direct messages moon icon */
      	/* change to block to show, none to hide */
      	--discord-icon: none; /* discord icon */
      	--moon-icon: block; /* moon icon */
      	--moon-icon-url: url('https://upload.wikimedia.org/wikipedia/commons/c/c4/Font_Awesome_5_solid_moon.svg'); /* custom icon url */
      	--moon-icon-size: auto;
      
      	/* filter uncolorable elements to fit theme */
      	/* (just set to none, they're too much work to configure) */
      	--login-bg-filter: saturate(0.3) hue-rotate(-15deg) brightness(0.4); /* login background artwork */
      	--green-to-accent-3-filter: hue-rotate(56deg) saturate(1.43); /* add friend page explore icon */
      	--blurple-to-accent-3-filter: hue-rotate(304deg) saturate(0.84) brightness(1.2); /* add friend page school icon */
      }
      
      /* Selected chat/friend text */
      .selected_f5eb4b,
      .selected_f6f816 .link_d8bfb3 {
        color: var(--text-0) !important;
        background: var(--accent-3) !important;
      }
      
      .selected_f6f816 .link_d8bfb3 * {
        color: var(--text-0) !important;
        fill: var(--text-0) !important;
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
