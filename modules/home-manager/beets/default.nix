{ pkgs, ... }: {
  programs.beets = {
    enable = true;

    package = pkgs.python3Packages.beets.override {
      pluginOverrides = {
        replaygain.enable = true;
      };
    };

    settings = {
      plugins = [
        "badfiles"
        "duplicates"
        "edit"
        "embedart"
        "fetchart"
        "fish"
        "ftintitle"
        "inline"
        "lastgenre"
        "lyrics"
        "musicbrainz"
        "replaygain"
      ];

      directory = "~/Music";
      library = "~/Music/library.db";

      import = {
        write = true;
        resume = true;
        group_albums = true;
        move = true;
        # quiet = true;
        # strong_rec_thresh = 0.90;
      };

      paths = {
        default = "$albumartist/$year - $album%aunique{}/%if{$multidisc,Disc $disc/}$track $title";
        singleton = "singleton: $artist/Singles/$year - $title";
        comp = "comp: Compilations/$year - $album%aunique{}/$track $title";
      };

      item_fields = {
        multidisc = "1 if disctotal > 1 else 0";
      };

      replaygain = {
        backend = "gstreamer";
        threads = 8;
      };

      replace = {
        "[\\x00-\\x1f]" = "_";
        "\\.$" = "_";
        "\\s+$" = "";
        "^\\s+" = "";
        "^-" = "_";
      };

      lyrics = {
        auto = false;
        sources = "lrclib";
        synced = true;
      };
    };
  };
}
