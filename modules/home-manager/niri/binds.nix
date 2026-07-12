{
  pkgs,
  config,
  lib,
  ...
}:
{
  wayland.windowManager.niri.settings.binds = {
    "Mod+Shift+Slash".show-hotkey-overlay = [ ];

    "Mod+Return" = {
      _props.hotkey-overlay-title = "Open a Terminal: ghostty";
      spawn-sh = "uwsm app -- ghostty +new-window";
    };

    "XF86AudioRaiseVolume" = {
      _props.allow-when-locked = true;
      spawn-sh = [ "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+ -l 1.0" ];
    };

    "XF86AudioLowerVolume" = {
      _props.allow-when-locked = true;
      spawn-sh = [ "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-" ];
    };

    "XF86AudioMute" = {
      _props.allow-when-locked = true;
      spawn-sh = [ "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle" ];
    };

    "XF86AudioMicMute" = {
      _props.allow-when-locked = true;
      spawn-sh = [ "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle" ];
    };

    "XF86AudioPlay" = {
      _props.allow-when-locked = true;
      spawn-sh = [ "${lib.getExe pkgs.playerctl} play-pause" ];
    };

    "XF86AudioStop" = {
      _props.allow-when-locked = true;
      spawn-sh = [ "${lib.getExe pkgs.playerctl} stop" ];
    };

    "XF86AudioPrev" = {
      _props.allow-when-locked = true;
      spawn-sh = [ "${lib.getExe pkgs.playerctl} previous" ];
    };

    "XF86AudioNext" = {
      _props.allow-when-locked = true;
      spawn-sh = [ "${lib.getExe pkgs.playerctl} next" ];
    };

    "Mod+Tab" = {
      _props.repeat = false;
      toggle-overview = [ ];
    };

    "Mod+Shift+Q" = {
      _props.repeat = false;
      close-window = [ ];
    };

    "Mod+Left".focus-column-left = [ ];
    "Mod+Down".focus-window-down = [ ];
    "Mod+Up".focus-window-up = [ ];
    "Mod+Right".focus-column-right = [ ];
    "Mod+H".focus-column-left = [ ];
    "Mod+J".focus-window-down = [ ];
    "Mod+K".focus-window-up = [ ];
    "Mod+L".focus-column-right = [ ];

    "Mod+Ctrl+Left".move-column-left = [ ];
    "Mod+Ctrl+Down".move-window-down = [ ];
    "Mod+Ctrl+Up".move-window-up = [ ];
    "Mod+Ctrl+Right".move-column-right = [ ];
    "Mod+Ctrl+H".move-column-left = [ ];
    "Mod+Ctrl+J".move-window-down = [ ];
    "Mod+Ctrl+K".move-window-up = [ ];
    "Mod+Ctrl+L".move-column-right = [ ];

    "Mod+Page_Down".focus-workspace-down = [ ];
    "Mod+Page_Up".focus-workspace-up = [ ];
    "Mod+U".focus-workspace-down = [ ];
    "Mod+I".focus-workspace-up = [ ];
    "Mod+Ctrl+Page_Down".move-column-to-workspace-down = [ ];
    "Mod+Ctrl+Page_Up".move-column-to-workspace-up = [ ];
    "Mod+Ctrl+U".move-column-to-workspace-down = [ ];
    "Mod+Ctrl+I".move-column-to-workspace-up = [ ];

    "Mod+Shift+Page_Down".move-workspace-down = [ ];
    "Mod+Shift+Page_Up".move-workspace-up = [ ];
    "Mod+Shift+U".move-workspace-down = [ ];
    "Mod+Shift+I".move-workspace-up = [ ];

    "Mod+WheelScrollDown" = {
      _props.cooldown-ms = 150;
      focus-workspace-down = [ ];
    };

    "Mod+WheelScrollUp" = {
      _props.cooldown-ms = 150;
      focus-workspace-up = [ ];
    };

    "Mod+Ctrl+WheelScrollDown" = {
      _props.cooldown-ms = 150;
      move-column-to-workspace-down = [ ];
    };

    "Mod+Ctrl+WheelScrollUp" = {
      _props.cooldown-ms = 150;
      move-column-to-workspace-up = [ ];
    };

    "Mod+Shift+WheelScrollDown".focus-column-right = [ ];
    "Mod+Shift+WheelScrollUp".focus-column-left = [ ];
    "Mod+Ctrl+Shift+WheelScrollDown".move-column-right = [ ];
    "Mod+Ctrl+Shift+WheelScrollUp".move-column-left = [ ];

    "Mod+1".focus-workspace = 1;
    "Mod+2".focus-workspace = 2;
    "Mod+3".focus-workspace = 3;
    "Mod+4".focus-workspace = 4;
    "Mod+5".focus-workspace = 5;
    "Mod+6".focus-workspace = 6;
    "Mod+7".focus-workspace = 7;
    "Mod+8".focus-workspace = 8;
    "Mod+9".focus-workspace = 9;
    "Mod+Shift+1".move-column-to-workspace = 1;
    "Mod+Shift+2".move-column-to-workspace = 2;
    "Mod+Shift+3".move-column-to-workspace = 3;
    "Mod+Shift+4".move-column-to-workspace = 4;
    "Mod+Shift+5".move-column-to-workspace = 5;
    "Mod+Shift+6".move-column-to-workspace = 6;
    "Mod+Shift+7".move-column-to-workspace = 7;
    "Mod+Shift+8".move-column-to-workspace = 8;
    "Mod+Shift+9".move-column-to-workspace = 9;

    "Mod+BracketLeft".consume-or-expel-window-left = [ ];
    "Mod+BracketRight".consume-or-expel-window-right = [ ];

    "Mod+Comma".consume-window-into-column = [ ];
    "Mod+Period".expel-window-from-column = [ ];

    "Mod+R".switch-preset-column-width = [ ];
    "Mod+Shift+R".switch-preset-window-height = [ ];
    "Mod+Ctrl+R".reset-window-height = [ ];
    "Mod+F".maximize-column = [ ];
    "Mod+Shift+F".fullscreen-window = [ ];

    "Mod+Ctrl+F".expand-column-to-available-width = [ ];

    "Mod+C".center-column = [ ];
    "Mod+Ctrl+C".center-visible-columns = [ ];

    "Mod+Minus".set-column-width = "-10%";
    "Mod+Equal".set-column-width = "+10%";

    "Mod+Shift+Space".toggle-window-floating = [ ];
    "Mod+Shift+V".switch-focus-between-floating-and-tiling = [ ];

    "Mod+W".toggle-column-tabbed-display = [ ];

    "Print".screenshot = [ ];
    "Ctrl+Print".screenshot-screen = [ ];
    "Alt+Print".screenshot-window = [ ];

    "Mod+Shift+E".quit = [ ];
    "Ctrl+Alt+Delete".quit = [ ];
    "Mod+Shift+P".power-off-monitors = [ ];
    "Mod+D".spawn-sh = "noctalia msg panel-toggle launcher";
    "Mod+S".spawn-sh = "noctalia msg panel-toggle control-center";
    "Mod+Shift+C".spawn-sh = "pkill noctalia && sleep 2 ; uwsm app -- noctalia";
    "Mod+Q".spawn-sh = "uwsm app -- ${lib.getExe config.programs.zen-browser.package}";
    "Mod+X".spawn-sh = "uwsm app -- ghostty -e yazi";
    "Mod+Z".spawn-sh = "uwsm app -- ghostty -e btop";
  };
}
