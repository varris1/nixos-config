{ pkgs, ... }: {
  home.packages = [
    pkgs.trash-cli
    pkgs.mediainfo
  ];

  programs.yazi = {
    enable = true;

    settings = {
      opener = {
        play = [
          {
            run = "mpv \"$@\"";
            orphan = true;
            for = "unix";
          }
        ];
      };

      open = {
        rules = [
          {
            mime = "{audio,video}/*";
            use = "play";
          }
        ];
      };
    };

    plugins = {
      full-border = {
        package = pkgs.yaziPlugins.full-border;
        setup = true;
      };

      yatline = {
        package = pkgs.yaziPlugins.yatline;
        setup = true;
        settings = {
          show_background = false;
        };
      };
      recycle-bin = {
        package = pkgs.yaziPlugins.recycle-bin;
        setup = true;
      };

      mount = pkgs.yaziPlugins.mount;
      restore = pkgs.yaziPlugins.restore;
      smart-enter = pkgs.yaziPlugins.smart-enter;
    };

    keymap = {
      mgr.prepend_keymap = [
        #plugin: smart-enter
        {
          on = "l";
          run = "plugin smart-enter";
          desc = "Enter the child directory, or open the file";
        }
        {
          on = "<Right>";
          run = "plugin smart-enter";
          desc = "Enter the child directory, or open the file";
        }
        #plugin: mount
        {
          on = "M";
          run = "plugin mount";
          desc = "Mount devices";
        }
        #plugin: recycle-bin
        {
          on = [
            "R"
            "b"
          ];
          run = "plugin recycle-bin";
          desc = "Open recycle bin menu";
        }
        #plugin: restore
        {
          on = [
            "U"
            "u"
          ];
          run = "plugin restore";
          desc = "Restore last deleted files/folders";
        }
      ];
    };
  };
}
