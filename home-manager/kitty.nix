{ ... }: {
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
}