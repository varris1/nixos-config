{ pkgs, ... }: {
  programs.mpv = {
    enable = true;
    config = {
      hwdec = "auto";
      osc = false; # is replaced by the thumbnail script
      force-window = true;
    };
    scripts = [
      pkgs.mpvScripts.thumbnail
    ];
  };
}
