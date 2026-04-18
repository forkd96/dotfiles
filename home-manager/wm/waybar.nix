{ ... }: {
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
}