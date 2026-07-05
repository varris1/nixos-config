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
        # "convert"
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
        singleton = "$artist/Singles/$year - $title";
        comp = "Compilations/$year - $album%aunique{}/$track $title";
      };

      # convert = {
      #   auto = true;
      #   copy_album_art = true;
      #   embed = true;
      #   never_convert_lossy_files = true;
      #   format = "opus";
      #   threads = 8;
      #   formats = {
      #     "opus" = {
      #       command = "ffmpeg -i $source -c:a libopus -b:a 192k -vbr on $dest";
      #       extension = "opus";
      #     };
      #   };
      # };

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
