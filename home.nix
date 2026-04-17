{ lib, pkgs, pkgs-unstable, ... }:
{ 
  home = {
    packages = with pkgs; [
      hello
      kitty
      eza
      bat
      kitty-themes
      fastfetch
      kde-rounded-corners

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
];

    username = "forkd";
    homeDirectory = "/home/forkd";
    stateVersion = "25.11";
  };

  nixpkgs.config.allowUnfree = true;

  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        "layer" = "top";
        "position" = "top";
        "height" = 32;
        "modules-left" = [
          "niri/workspaces"
        ];
        "modules-center" = [
          "cpu"
          "memory"
        ];
        "modules-right" = [
          "pulseaudio"
          "niri/language"
          "clock"
          "battery"
        ];
        "custom/space" = {
          "format" = " ";
          "tooltip" = "false";
        };
        "custom/runner" = {
          "format" = "";
          "on-click" = "rofi -show drun";
        };
        "niri/workspaces" = {
          "disable-scroll" = true;
          "format" = "{name}";
          "all-outputs" = false;
        };
        "custom/date" = {
          "format" = "{}";
          "exec" = "date '+%I =%M %p %B %d'";
          "interval" = "1";
        };
        "clock" = {
          "format" = "{:%B %d %I:%M %p} |  ";
        };
        "pulseaudio" = {
          "format" = "{icon} {volume}%";
          "format-bluetooth" = "{icon}  {volume}%";
          "format-muted" = "{icon} MUTE";
          "format-icons" = {
            "headphones" = "";
            "default" = [
              ""
              ""
            ];
         };
         "scroll-step" = 5;
         "on-click" = "pavucontrol";
        };
        "network" = {
          "format-wifi" = " ";
          "format-ethernet" = "";
          "format-disconnected" = "󱚼";
          "max-length" = 30;
          "on-click" = "nm-applet";
        };
        "memory" = {
          "interval" = 1;
          "format" = "  {}%";
          "on-click" = "gnome-system-monitor";
        };
        "cpu" = {
          "interval" = 1;
          "format" = " {usage}%";
          "on-click" = "gnome-system-monitor";
        };
        "niri/language" = {
          "format" = "  {short}";
          "on-click" = "ydotool key 125 =1 57 =1 57 =0 125 =0";
        };
        "battery" = {
          "states" = {
             "good" = 95;
             "warning" = 30;
             "critical" = 15;
          };
          "format" = "{icon} ";
          "tooltip-format" = "{capacity}%";
          "format-icons" = [
            ""
            ""
            ""
            ""
            ""
          ];
        };
        "mpris" = {
          "interval" = 5;
          "format" = "{player_icon} {dynamic}";
          "format-paused" = "{status_icon} <i>{dynamic}</i>";
          "dynamic-order" = [
            "artist"
            "title"
          ];
          "default" = "▶";
          "spotify" = "";
        };
        "tray" = {
          "icon-size" = 17;
          "spacing" = 7;
        };
      };
    };
    style = ''
      /* ~/.config/waybar/style.css */

      * {
            font-size: 18px;
            font-family: "JetBrainsMono Nerd Font", monospace;
            border: none;
            border-radius: 0;
            min-height: 0;
            margin: 0;
            padding: 0;
      }

      window#waybar {
            background: #1e1e2e;
            color: #fdf6e3;
            margin: 0;
            padding: 0;
      }

      #workspaces,
      #clock.1,
      #clock.2,
      #clock.3,
      #pulseaudio,
      #memory,
      #cpu,
      #battery,
      #disk,
      #tray,
      #network,
      #language,
      #clock {
            background: #1e1e2e;
            margin-top: 0;
            margin-bottom: 0;
            padding: 0;
      }

      #clock.1,
      #clock.2,
      #clock.3,
      #pulseaudio,
      #memory,
      #cpu,
      #battery,
      #disk,
      #tray,
      #network,
      #language,
      #clock {
            margin: 0;
            min-height: 32px;
      }

      #custom-runner {
            background: #1e1e2e;
            margin-left: 7px;
            margin-right: 7px;
            padding-left: 10px;
            padding-right: 12px;
      }

      #workspaces button label {
            padding: 0 20px;
            margin-right: 5px;
            color: #cad3f5;
      }

      #workspaces button.active label {
            color: #cad3f5;
      }

      #workspaces button:hover {
            background: #3c3836;
      }

      #workspaces button.active {
            background: #313244;
      }

      #workspaces {
            margin-left: 13px;
      }

      #pulseaudio {
            color: #8aadf4;
            box-shadow: inset 0 -2px 0 #8aadf4;
      }

      #memory {
            color: #eed49f;
            box-shadow: inset 0 -2px 0 #eed49f;
      }

      #cpu {
            color: #ee99a0;
            box-shadow: inset 0 -2px 0 #ee99a0;
      }

      #battery {
            color: #a6da95;
            box-shadow: inset 0 -2px 0 #a6da95;
            margin-right: 13px;
      }

      #language {
            color: #f5a97f;
            box-shadow: inset 0 -2px 0 #f5a97f;
      }

      #custom-runner {
            color: #cad3f5;
            box-shadow: inset 0 -2px 0 #cad3f5;
      }

      #clock {
            color: #b7bdf8;
            box-shadow: inset 0 -2px 0 #b7bdf8;
      }

      #clock,
      #pulseaudio,
      #memory,
      #cpu,
      #battery,
      #disk,
      #network,
      #custom-dnd,
      #language {
            padding: 0 10px;
      }

      #workspaces button:hover,
      #pulseaudio:hover,
      #cpu:hover,
      #memory:hover,
      #battery:hover,
      #clock:hover,
      #language:hover {
            background: #24273a;
            border: 0;
      }
    '';
  };

  xdg.configFile."niri/config.kdl".text = ''
    // --- input ---
    input {
        keyboard {
            xkb {
                layout "us,ru"
            }
        }

        touchpad {
            tap
            tap-button-map "left-right-middle"
            scroll-method "two-finger"
            // natural-scroll
        }

        focus-follows-mouse max-scroll-amount="0%"
    }

    output "eDP-1" {
        mode "1920x1080@60.012"
        scale 1
    }

    prefer-no-csd

    hotkey-overlay {
        skip-at-startup
    }

    spawn-sh-at-startup "matuwall --daemon"
    spawn-at-startup "waybar" "--config" "/home/forkd/.config/waybar/config"
    spawn-at-startup "ydotoold"
    spawn-at-startup "wl-paste" "--watch" "cliphist" "store"
    spawn-at-startup "swaync"
    spawn-at-startup "awww-daemon"
    spawn-sh-at-startup "gsr-ui launch-daemon"

    layout {
        gaps 14

        center-focused-column "never"

        preset-column-widths {
            proportion 0.33333
            proportion 0.5
            proportion 0.66667
        }

        default-column-width { proportion 0.5; }

        focus-ring {
            width 2
            active-color "#b7bdf8"
            inactive-color "#6e738d"
            urgent-color "#fcb167"
        }

        border {
            off
            width 4
            active-color "#ffc87f"
            inactive-color "#505050"
            urgent-color "#9b0000"
        }

        shadow {
            off
            draw-behind-window true
            softness 30
            spread 5
            offset x=0 y=5
            color "#0007"
        }

        struts {
            // left 64
            // right 64
            // top 64
            // bottom 64
        }
    }

    animations {
        workspace-switch {
            spring damping-ratio=0.8 stiffness=600 epsilon=0.0001
        }

        window-open {
            spring damping-ratio=0.8 stiffness=700 epsilon=0.0001
        }

        window-close {
            duration-ms 150
            curve "ease-out-quad"
        }

        horizontal-view-movement {
            spring damping-ratio=0.8 stiffness=450 epsilon=0.0001
        }

        window-movement {
            spring damping-ratio=0.7 stiffness=500 epsilon=0.0001
        }

        window-resize {
            spring damping-ratio=0.7 stiffness=500 epsilon=0.0001
        }

        config-notification-open-close {
            spring damping-ratio=0.6 stiffness=1000 epsilon=0.001
        }

        exit-confirmation-open-close {
            spring damping-ratio=0.6 stiffness=500 epsilon=0.01
        }

        screenshot-ui-open {
            duration-ms 200
            curve "ease-out-quad"
        }

        overview-open-close {
            spring damping-ratio=0.7 stiffness=600 epsilon=0.0001
        }

        recent-windows-close {
            spring damping-ratio=0.7 stiffness=600 epsilon=0.001
        }
    }

    window-rule {
        geometry-corner-radius 0
        clip-to-geometry true
    }

    window-rule {
        match app-id="otter"
        open-floating true
        default-column-width { fixed 600; }
        default-window-height { fixed 400; }
    }

    binds {
        Mod+Shift+E { quit; }
        Ctrl+Alt+Delete { quit; }

        Mod+Shift+Slash { show-hotkey-overlay; }

        Mod+O repeat=false { toggle-overview; }

        Print { screenshot; }

        Mod+Return { spawn "kitty"; }
        Alt+Shift+T { spawn "kitty"; }

        Mod+BackSlash { spawn "nautilus"; }

        Alt+Space { spawn "kitty" "--app-id" "'otter'" "otter-launcher"; }

        Ctrl+Alt+Space { spawn "matuwall"; }

        Mod+Shift+Period {
            spawn "rofi" "-show" "emoji"
        }

        Mod+Shift+Comma {
            spawn "rofi" "-modi" "clipboard:/home/forkd/progs/bin/cliphist-rofi-img" "-show" "clipboard" "-show-icons"
        }

        Mod+Slash { spawn "rofi" "-show" "calc"; }

        Mod+Space {
            switch-layout "next"
        }

        Mod+Comma { consume-window-into-column; }
        Mod+Period { expel-window-from-column; }

        Alt+F4 { close-window; }
        Mod+Q { close-window; }

        Mod+R { switch-preset-column-width; }
        Mod+Shift+R { switch-preset-window-height; }
        Mod+Ctrl+R { reset-window-height; }

        Mod+Shift+F { maximize-column; }
        Mod+Ctrl+F { expand-column-to-available-width; }

        Mod+C { center-column; }
        Mod+Ctrl+C { center-visible-columns; }

        Mod+Minus { set-column-width "-10%"; }
        Mod+Equal { set-column-width "+10%"; }
        Mod+Shift+Minus { set-window-height "-10%"; }
        Mod+Shift+Equal { set-window-height "+10%"; }

        Mod+V { toggle-window-floating; }
        Mod+Shift+V { switch-focus-between-floating-and-tiling; }

        Mod+W { toggle-column-tabbed-display; }

        Mod+H { focus-column-left; }
        Mod+J { focus-window-down; }
        Mod+K { focus-window-up; }
        Mod+L { focus-column-right; }

        Mod+Left { focus-column-left; }
        Mod+Down { focus-window-down; }
        Mod+Up { focus-window-up; }
        Mod+Right { focus-column-right; }

        Mod+Shift+H { move-column-left; }
        Mod+Shift+J { move-window-down; }
        Mod+Shift+K { move-window-up; }
        Mod+Shift+L { move-column-right; }

        Mod+Shift+Left { move-column-left; }
        Mod+Shift+Down { move-window-down; }
        Mod+Shift+Up { move-window-up; }
        Mod+Shift+Right { move-column-right; }

        Mod+WheelScrollDown cooldown-ms=150 { focus-workspace-down; }
        Mod+WheelScrollUp cooldown-ms=150 { focus-workspace-up; }
        Mod+Ctrl+WheelScrollDown cooldown-ms=150 { move-column-to-workspace-down; }
        Mod+Ctrl+WheelScrollUp cooldown-ms=150 { move-column-to-workspace-up; }

        Mod+WheelScrollRight { focus-column-right; }
        Mod+WheelScrollLeft { focus-column-left; }
        Mod+Ctrl+WheelScrollRight { move-column-right; }
        Mod+Ctrl+WheelScrollLeft { move-column-left; }

        Mod+Shift+WheelScrollDown { focus-column-right; }
        Mod+Shift+WheelScrollUp { focus-column-left; }
        Mod+Ctrl+Shift+WheelScrollDown { move-column-right; }
        Mod+Ctrl+Shift+WheelScrollUp { move-column-left; }

        Mod+F { fullscreen-window; }
        F11 { fullscreen-window; }

        Mod+Shift+Space { toggle-window-floating; }

        Mod+1 { focus-workspace 1; }
        Mod+2 { focus-workspace 2; }
        Mod+3 { focus-workspace 3; }
        Mod+4 { focus-workspace 4; }
        Mod+5 { focus-workspace 5; }
        Mod+6 { focus-workspace 6; }
        Mod+7 { focus-workspace 7; }
        Mod+8 { focus-workspace 8; }
        Mod+9 { focus-workspace 9; }
        Mod+0 { focus-workspace 10; }

        Mod+Shift+1 { move-window-to-workspace 1; }
        Mod+Shift+2 { move-window-to-workspace 2; }
        Mod+Shift+3 { move-window-to-workspace 3; }
        Mod+Shift+4 { move-window-to-workspace 4; }
        Mod+Shift+5 { move-window-to-workspace 5; }
        Mod+Shift+6 { move-window-to-workspace 6; }
        Mod+Shift+7 { move-window-to-workspace 7; }
        Mod+Shift+8 { move-window-to-workspace 8; }
        Mod+Shift+9 { move-window-to-workspace 9; }
        Mod+Shift+0 { move-window-to-workspace 10; }

        XF86AudioMute {
            spawn "pactl" "set-sink-mute" "@DEFAULT_SINK@" "toggle"
        }

        XF86AudioLowerVolume {
            spawn "pactl" "set-sink-volume" "@DEFAULT_SINK@" "-5%"
        }

        XF86AudioRaiseVolume {
            spawn "pactl" "set-sink-volume" "@DEFAULT_SINK@" "+5%"
        }

        XF86AudioMicMute {
            spawn "pactl" "set-source-mute" "@DEFAULT_SOURCE@" "toggle"
        }

        XF86MonBrightnessDown {
            spawn "brightnessctl" "set" "5%-"
        }

        XF86MonBrightnessUp {
            spawn "brightnessctl" "set" "5%+"
        }
    }

    workspace "󰖟"
    workspace ""
    workspace "󰅴"
    workspace ""
    workspace "󰍡"
    workspace "󰊖"
    workspace ""
    workspace "󰇘"
  '';

  programs.fish = {
    enable = true;
    package = pkgs-unstable.fish;
    interactiveShellInit = "
    set fish_greeting ''
    set -gx TERM xterm-256color 
     ";
    shellAbbrs = {
      nt = "nmtui";
      bt = "bluetui";
      b = "bat -l conf -p";
      nv = "nvim";
      cfg = "sudo nvim /etc/nixos/configuration.nix";
      ff = "fastfetch";
    };
    shellAliases = {
      ls = "eza --icons always";
      faker = "~/.venv/bin/faker";
    };
    functions = {
      mkcd = "mkdir -p $argv && cd $argv";
    };
      plugins = [
    {
      name = "z";
      src = pkgs.fishPlugins.z.src;
    }
    {
      name = "fzf-fish";
      src = pkgs.fishPlugins.fzf-fish.src;
    }
    {
      name = "tide";
      src = pkgs.fishPlugins.tide.src;
    }
  ];
  };

  programs.kitty = {
    enable = true;
    themeFile = "Catppuccin-Macchiato";
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 12;
    };
    shellIntegration = { 
      enableFishIntegration = true;
    };
    extraConfig = "
      confirm_os_window_close 0
      cursor_trail 1
      scrollback_lines 2000
      wheel_scroll_min_lines 1
      enable_audio_bell no
      window_padding_width 4
      selection_foreground none
      selection_background none
      
      tab_bar_min_tabs            1
      tab_bar_edge                bottom
      tab_bar_style               powerline
      tab_powerline_style         slanted
      tab_title_template          {title}{'  ={} ='.format(num_windows) if num_windows > 1 else ''}
      hide_window_decorations no
      window_padding_width 13

      mouse_map alt+left press ungrabbed mouse_selection rectangle";
  };

  programs.nixvim = {
    enable = true;

    colorschemes.catppuccin = {
      enable = true;
      flavour = "macchiato";
    };

    plugins = {
      lualine.enable = true;
      nvim-tree.enable = true;
      web-devicons.enable = true;

      luasnip.enable = true;

      presence-nvim.enable = true;
    };

    extraConfigLua = ''
      require('nvim-tree').setup()
      require('lualine').setup()

      vim.api.nvim_create_autocmd('VimEnter', {
        callback = function()
          require('nvim-tree.api').tree.open()
        end;
      })
    '';

    extraPackages = with pkgs; [
      xclip
      wl-clipboard
    ];
  };

  # fsel
  xdg.configFile."fsel/config.toml".text = ''
    # Default values
    highlight_color = "Blue"
    cursor = "█"
    terminal_launcher = "alacritty -e"
    hard_stop = false

    # UI Customization
    rounded_borders = false

    # Border Colors (individual colors for each panel)
    main_border_color = "White"      # Border color for the main info panel (top)
    apps_border_color = "White"      # Border color for the apps list panel (middle)
    input_border_color = "White"     # Border color for the input panel (bottom)

    # Text Colors (non-highlighted text in each panel)
    main_text_color = "White"        # Text color for the main info panel
    apps_text_color = "White"        # Text color for the apps list
    input_text_color = "White"       # Text color for the input field

    # Fancy Mode - Show selected app info in panel titles
    fancy_mode = true               # When true = "Apps" becomes selected app name; "Gyr" becomes app description

    # Header title color (for panel border titles)
    header_title_color = "Blue" # Color for all panel header titles

    title_panel_height_percent = 30  # Height of top panel as percentage (10-70%)
    input_panel_height = 3           # Height of input panel in lines (1-10)
'';
}
