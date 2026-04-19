{ config, ... }: {
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer    = "top";
        position = "top";
        height   = 32;

        modules-left   = [ "niri/workspaces" ];
        modules-center = [ "cpu" "memory" ];
        modules-right  = [ "pulseaudio" "niri/language" "battery" "clock" ];

        "custom/space" = {
          format  = " ";
          tooltip = "false";
        };

        "custom/runner" = {
          format   = "";
          on-click = "rofi -show drun";
        };

        "niri/workspaces" = {
          disable-scroll = true;
          format         = "{name}";
          all-outputs    = false;
        };

        "custom/date" = {
          format   = "{}";
          exec     = "date '+%I =%M %p %B %d'";
          interval = "1";
        };

        clock = {
          format = "{:%B %d %I:%M %p} |  ";
        };

        pulseaudio = {
          format           = "{icon} {volume}%";
          format-bluetooth = "{icon}  {volume}%";
          format-muted     = "{icon} MUTE";
          format-icons = {
            headphones = "";
            default    = [ "" "" ];
          };
          scroll-step = 5;
          on-click    = "pavucontrol";
        };

        network = {
          format-wifi        = " ";
          format-ethernet    = "";
          format-disconnected = "󱚼";
          max-length         = 30;
          on-click           = "nm-applet";
        };

        memory = {
          interval = 1;
          format   = "  {}%";
          on-click = "gnome-system-monitor";
        };

        cpu = {
          interval = 1;
          format   = " {usage}%";
          on-click = "gnome-system-monitor";
        };

        "niri/language" = {
          format   = "  {short}";
          on-click = "ydotool key 125 =1 57 =1 57 =0 125 =0";
        };

        battery = {
          states = {
            good     = 95;
            warning  = 30;
            critical = 15;
          };
          format         = "{icon} ";
          tooltip-format = "{capacity}%";
          format-icons   = [ "" "" "" "" "" ];
        };

        mpris = {
          interval      = 5;
          format        = "{player_icon} {dynamic}";
          format-paused = "{status_icon} <i>{dynamic}</i>";
          dynamic-order = [ "artist" "title" ];
          default       = "▶";
          spotify       = "";
        };

        tray = {
          icon-size = 17;
          spacing   = 7;
        };
      };
    };

    style = ''
      * {
        font-size:   18px;
        font-family: "JetBrainsMono Nerd Font", "Symbols Nerd Font Mono", monospace;
      }

      window#waybar {
        background: transparent;
        color:      #fdf6e3;
      }

      #workspaces,
      #clock.1, #clock.2, #clock.3,
      #pulseaudio,
      #cpu,
      #memory,
      #battery,
      #disk,
      #tray,
      #network,
      #language,
      #clock {
        background:    #363a4f;
        border-radius: 15px;
        margin-left:   7px;
        margin-right:  7px;
        margin-top:    7px;
        padding:       3px;
      }

      #custom-runner {
        background:     #363a4f;
        border-radius:  15px;
        margin-left:    7px;
        margin-right:   7px;
        margin-top:     7px;
        padding-left:   10px;
        padding-right:  12px;
      }

      #workspaces button {
        padding: 0 5px;
        color:   #cad3f5;
      }

      #workspaces button label {
        padding:      0 7px;
        margin-right: 5px;
        color:        #cad3f5;
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

      #workspaces button.focused {
        color: #8aadf4;
      }

      #pulseaudio { color: #8aadf4; }
      #memory     { color: #eed49f; }
      #cpu        { color: #ee99a0; }
      #battery    { color: #a6da95; }
      #language   { color: #a6da95; }
      #custom-runner { color: #cad3f5; }

      #clock {
        color:        #b7bdf8;
        margin-right: 13px;
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
        background: #494d64;
      }
    '';
  };
}
