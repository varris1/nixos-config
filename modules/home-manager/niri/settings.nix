{
  wayland.windowManager.niri.settings = {
    output = [
      {
        _args = [ "DP-1" ];
        position._props = {
          x = 0;
          y = 0;
        };
        focus-at-startup = [ ];
      }
      {
        _args = [ "DP-2" ];
        position._props = {
          x = -2560;
          y = 0;
        };
      }
    ];

    input = {
      keyboard.xkb = {
        layout = "us";
        variant = "altgr-intl";
        options = "eurosign:e";
      };

      mouse.accel-profile = "flat";

      focus-follows-mouse._props = {
        max-scroll-amount = "0%";
      };
    };

    gestures.hot-corners.off = [ ];

    layout = {
      gaps = 16;
      preset-column-widths._children = [
        { proportion = 0.33333; }
        { proportion = 0.5; }
        { proportion = 0.66667; }
        { proportion = 1.0; }
      ];

      focus-ring.width = 2;
      border.off = [ ];

      shadow = {
        on = [ ];
        softness = 20;
        spread = 6;
        offset._props = {
          x = 0;
          y = 5;
        };
      };
    };

    prefer-no-csd = [ ];
    debug.honor-xdg-activation-with-invalid-serial = [ ];

    hotkey-overlay.skip-at-startup = [ ];

    window-rule = [
      {
        geometry-corner-radius = 20;
        clip-to-geometry = true;

        background-effect = {
          blur = true;
          xray = false;
        };
      }

      {
        match._props.app-id = "dev.noctalia.Noctalia.Settings";
        open-floating = true;
        default-column-width.fixed = 1080;
        default-window-height.fixed = 920;
      }

      {
        match._props.app-id._raw = ''r#"^zen-beta$"#'';

        draw-border-with-background = false;
        open-maximized = true;
      }

      {
        match._props.app-id._raw = ''r#"^mpv$"#'';
        open-floating = true;
        default-column-width.fixed = 1920;
        default-window-height.fixed = 1080;
      }
    ];

    layer-rule = [
      {
        match._props.namespace = "^noctalia-(bar-[^\"]+|notification|dock|panel|attached-panel|osd)$";

        background-effect = {
          xray = false;
        };
      }

      {
        match._props.namespace = "^noctalia-backdrop";
        place-within-backdrop = true;
      }
    ];

    spawn-at-startup = [ "noctalia" ];
  };
}
