{ ... }: {
  services.swaync = {
    enable = true;
    settings = {
      positionX = "right";
      positionY = "top";
      cssPriority = "user";
    
      layer = "overlay";
      control-center-layer = "top";
      layer-shell = true;
    
      control-center-width = 390;
      control-center-height = 750;
      control-center-margin-top = 10;
      control-center-margin-bottom = 10;
      control-center-margin-right = 10;
      control-center-margin-left = 0;
    
      notification-window-width = 380;
      notification-icon-size = 50;
      notification-body-image-height = 200;
      notification-body-image-width = 200;
    
      timeout = 8;
      timeout-low = 6;
      timeout-critical = 0;
    
      fit-to-screen = false;
      keyboard-shortcuts = true;
      image-visibility = "when-available";
      transition-time = 200;
      hide-on-clear = false;
      hide-on-action = true;
      text-empty = "No Notifications";
      script-fail-notify = true;
    
      notification-visibility = {
        example-name = {
          state = "muted";
          urgency = "Low";
          app-name = "Spotify";
        };
      };
    
      widgets = [
        "buttons-grid"
        "mpris"
        "volume"
        "backlight"
        "dnd"
        "title"
        "notifications"
      ];
    
      widget-config = {
        mpris = {
          image-size = 50;
          image-radius = 0;
        };
        volume = {
          label = " 󰕾 ";
          expand-button-label = " ";
          collapse-button-label = " ";
          show-per-app = true;
          show-per-app-icon = true;
          show-per-app-label = false;
        };
        backlight = {
          label = "󰃟 ";
        };
        dnd = {
          text = "Do Not Disturb";
        };
        title = {
          text = "Notifications Center";
          clear-all-button = true;
          button-text = " 󰆴 ";
        };
        buttons-grid = {
          actions = [
            {
              label = " ";
              type = "toggle";
              active = true;
              command = "sh -c '[[ $SWAYNC_TOGGLE_STATE == true ]] && nmcli radio wifi on || nmcli radio wifi off'";
              update-command = "sh -c '[[ $(nmcli r wifi) == \"enabled\" ]] && echo true || echo false'";
            }
            {
              label = "󰂯";
              type = "toggle";
              active = true;
              command = "sh -c '[[ $SWAYNC_TOGGLE_STATE == true ]] && rfkill unblock bluetooth || rfkill block bluetooth'";
              update-command = "sh -c \"rfkill list bluetooth | grep -q \\\"Soft blocked: no\\\" && echo true || echo false\"";
            }
            {
              label = " ";
              type = "toggle";
              active = false;
              command = "sh -c '[[ $SWAYNC_TOGGLE_STATE == true ]] && pactl set-source-mute @DEFAULT_SOURCE@ 1 || pactl set-source-mute @DEFAULT_SOURCE@ 0'";
              update-command = "sh -c '[[ $(pactl get-source-mute @DEFAULT_SOURCE@) == *yes* ]] && echo true || echo false'";
            }
            {
              label = " ";
              type = "toggle";
              active = false;
              command = "sh -c '[[ $SWAYNC_TOGGLE_STATE == true ]] && pactl set-sink-mute @DEFAULT_SINK@ 1 || pactl set-sink-mute @DEFAULT_SINK@ 0'";
              update-command = "sh -c '[[ $(pactl get-sink-mute @DEFAULT_SINK@) == *yes* ]] && echo true || echo false'";
            }
          ];
        };
      };
    };
    style = ''
      @import "colors.css";
    
      @define-color cc_bg @surface_container_low;
      @define-color cc_bg_alt @surface_container;
      @define-color cc_fg @on_surface;
      @define-color cc_fg_muted @on_surface_variant;
      @define-color cc_border @outline_variant;
      @define-color cc_accent @primary;
      @define-color cc_accent_fg @on_primary;
      @define-color cc_danger @error_container;
      @define-color cc_danger_fg @on_error_container;
    
      * {
          outline: none;
          border: none;
          font-family: "Poppins Semibold", "Symbols Nerd Font";
          font-size: 15px;
          text-shadow: none;
          color: @cc_fg;
          background-color: transparent;
          background: transparent;
      }
    
      .control-center {
          background-color: alpha(@cc_bg, 0.97);
          color: @cc_fg;
          border: 1px solid alpha(@cc_border, 0.7);
          box-shadow: 0 8px 24px alpha(#000000, 0.35);
          padding: 8px;
          border-radius: 16px;
          margin-top: 4px;
          margin-right: 4px;
      }
    
      .control-center .notification-row .notification-background {
          border-radius: 14px;
          margin-top: 5px;
      }
    
      .notification {
          background-color: @cc_bg_alt;
          color: @cc_fg;
          border-radius: 14px;
          border: 1px solid alpha(@cc_border, 0.7);
          margin-top: 10px;
          margin-right: 10px;
      }
    
      .notification > *:last-child > *  {
          margin: 6px;
      }
    
      .summary,
      .body,
      .widget-title > label,
      .widget-dnd > label,
      .widget-backlight > label,
      .widget-volume label,
      .widget-mpris .widget-mpris-title {
          color: @cc_fg;
      }
    
      .time,
      .widget-mpris .widget-mpris-subtitle,
      .notification-group-header,
      .notification-group-icon {
          color: @cc_fg_muted;
      }
    
      .summary {
          font-size: 1.02rem;
          padding-left: 12px;
      }
    
      .time {
          font-size: 0.8rem;
      }
    
      .body {
          font-size: 0.95rem;
          padding-left: 12px;
      }
    
      .notification-content {
          padding: 12px 12px 10px 14px;
      }
    
      .notification-action > button {
          padding: 6px;
          margin: 6px;
      }
    
      .notification-action > label {
          font-size: 0.95rem;
          font-weight: normal;
          color: @cc_fg;
      }
    
      .notification.critical {
          background-color: alpha(@cc_danger, 0.95);
          border: 1.4px solid @error;
          box-shadow: 0 0 5px 0 alpha(#000000, 0.45);
          color: @cc_danger_fg;
      }
    
      .notification.low,
      .notification.normal {
          background-color: @cc_bg_alt;
          border: 1.4px solid @cc_border;
          box-shadow: 0 0 5px 0 alpha(#000000, 0.25);
      }
    
      .close-button {
          background-color: @surface_container_highest;
          color: @cc_fg;
          box-shadow: 0 0 3px 0 alpha(#000000, 0.25);
          padding: 6px;
          margin: 18px;
          border-radius: 999px;
      }
    
      .close-button:hover {
          background-color: alpha(@error, 0.85);
          color: @on_error;
      }
    
      .notification-group-header,
      .notification-group-icon {
          font-size: 0.9rem;
      }
    
      .notification-group-collapse-button,
      .notification-group-close-all-button {
          box-shadow: 0 0 3px 0 alpha(#000000, 0.25);
          background-color: @surface_container_highest;
          color: @cc_fg;
      }
    
      .notification-group-collapse-button:hover {
          background-color: alpha(@surface_container_highest, 0.85);
      }
    
      .notification-group-close-all-button:hover {
          background-color: alpha(@error, 0.85);
          color: @on_error;
      }
    
      trough highlight {
          background: @cc_accent;
      }
    
      scale trough {
          margin: 0rem 1rem;
          background-color: @cc_border;
          min-height: 8px;
          min-width: 70px;
          border-radius: 999px;
      }
    
      slider {
          background-color: @cc_border;
      }
    
      tooltip {
          background-color: @inverse_surface;
          color: @inverse_on_surface;
          border-radius: 10px;
      }
    
      scrollbar,
      scrollbar trough,
      scrollbar slider {
          background: transparent;
      }
    
      scrollbar {
          min-width: 8px;
          margin: 6px 2px 6px 0;
      }
    
      scrollbar trough {
          margin: 0;
      }
    
      scrollbar slider {
          min-width: 4px;
          min-height: 36px;
          border-radius: 999px;
          background-color: alpha(@cc_fg_muted, 0.35);
      }
    
      scrollbar slider:hover {
          background-color: alpha(@cc_fg_muted, 0.55);
      }
    
      /*** Widgets ***/
      .widget-buttons-grid {
          font-size: 1rem;
          padding: 14px 14px 8px;
          margin: unset;
      }
    
      .widget-buttons-grid > flowbox > flowboxchild > button {
          background: @surface_container_high;
          color: @cc_fg;
          box-shadow: 0px 0px 10px alpha(@background, 0.4);
          border-radius: 12px;
          min-width: 56px;
          min-height: 32px;
          padding: 6px;
          margin: 0 3px;
          transition: all .2s ease;
      }
    
      .widget-buttons-grid > flowbox > flowboxchild > button:hover {
          background: @surface_container_highest;
      }
    
      .widget-buttons-grid > flowbox > flowboxchild > button.toggle:checked {
          background: @primary_container;
          color: @on_primary_container;
      }
    
      .widget-buttons-grid > flowbox > flowboxchild > button.toggle:checked:hover {
          background: alpha(@primary_container, 0.85);
      }
    
      @define-color mpris-album-art-overlay rgba(0, 0, 0, 0.42);
      @define-color mpris-button-hover rgba(0, 0, 0, 0.25);
    
      .widget-mpris .widget-mpris-player {
          padding: 14px;
          margin: 14px 18px;
          background-color: alpha(@surface_container_highest, 0.88);
          border-radius: 14px;
          border: 1px solid alpha(@outline_variant, 0.6);
          box-shadow: 0px 0px 10px alpha(#000000, 0.35);
      }
    
      .widget-mpris .widget-mpris-player .widget-mpris-album-art {
          border-radius: 12px;
          box-shadow: 0px 0px 10px alpha(#000000, 0.35);
      }
    
      .widget-mpris .widget-mpris-player .widget-mpris-title {
          font-weight: bold;
          font-size: 1.1rem;
          margin: 0px 8px 6px 8px;
          color: @cc_fg;
      }
    
      .widget-mpris .widget-mpris-player .widget-mpris-subtitle {
          font-size: 0.95rem;
          color: @cc_fg_muted;
      }
    
      .widget-mpris .widget-mpris-player > box > button:hover {
          background-color: @surface_container_highest;
      }
    
      .widget-mpris > box > button:hover {
          background: alpha(@surface_container_highest, 0.6);
      }
    
      .widget-volume {
          padding: 4px 5px 5px 5px;
          margin: unset;
          font-size: 1.15rem;
          color: @cc_fg;
      }
    
      .widget-volume > box > button {
          border: none;
          color: @cc_fg;
      }
    
      .per-app-volume {
          padding: 4px 8px 8px 8px;
          margin: 0px 8px 8px 8px;
      }
    
      .widget-backlight {
          padding: 0 0 3px 16px;
          margin: unset;
          font-size: 1.05rem;
          color: @cc_fg;
      }
    
      .widget-dnd {
          font-weight: bold;
          margin: unset;
          padding: 14px 15px 12px 15px;
          color: @cc_fg;
      }
    
      .widget-dnd > switch {
          font-size: initial;
          border-radius: 999px;
          background: @surface_container_highest;
          border: none;
          box-shadow: none;
          padding: 3px;
      }
    
      .widget-dnd > switch:checked {
          background: @cc_accent;
      }

      .widget-dnd > switch:not(:checked) slider {
          background: @on_surface;
      }
    
      .widget-dnd > switch slider {
          background: @on_primary;
          border-radius: 999px;
          min-width: 18px;
          min-height: 18px;
      }
    
      .widget-title {
          padding: 14px 15px;
          margin: unset;
          font-weight: bold;
          color: @cc_fg;
      }
    
      .widget-title > label {
          font-size: 1.25rem;
          color: @cc_fg;
      }
    
      .widget-title > button {
          padding: 0px 8px;
          margin: unset;
          text-shadow: none;
          background: @error;
          color: @on_error;
          border: none;
          box-shadow: none;
          border-radius: 999px;
          transition: all .2s ease;
      }
    
      .widget-title > button:hover {
          background: alpha(@error, 0.85);
          box-shadow: 0 0 10px 0 alpha(#000000, 0.35);
      }
    '';
  };
}
