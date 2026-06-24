{
  programs.ghostty = {
    enable = true;
    systemd.enable = true;
    settings = {
      window-padding-x = 14;
      window-padding-y = 14;
      # adjust-cell-height = "10%";
      copy-on-select = "clipboard";
      scrollbar = "never";
      confirm-close-surface = "false";
      app-notifications = [ "no-clipboard-copy" ];
    };
  };
}
