{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = {

    miscellaneous = {
      path = "${config.home.homeDirectory}/Music";
      allowNotifications = 1;
      stripTrackNumbers = 1;
      hideLogo = 0;
      hideHelp = 0;
      hideTimeStatus = 0;
      hideFooter = 0;
      hideSideCover = 0;

      # Delay when drawing title in track view, set to 0 to have no delay.
      titleDelay = 9;
      # Same as '--quitonstop' flag, exits after playing the whole playlist.
      quitOnStop = 0;
      # Whether clearing the playlist also removes the currently playing song.
      clearListClearsAll = 1;
      # Glimmering text on the bottom row.
      hideGlimmeringText = 0;
      # Replay gain check first, can be either 0=track, 1=album or 2=disabled.
      replayGainCheckFirst = 0;
      # Save Repeat and Shuffle Settings.
      saveRepeatShuffleSettings = 1;
      repeatState = 0;
      shuffleEnabled = 0;
      # Set the window title to the title of the currently playing track
      trackTitleAsWindowTitle = 1;

    };

    colors = {
      # Theme's go in ~/.config/kew/themes (on Linux/FreeBSD/Android),
      # and ~/Library/Preferences/kew/themes (on macOS),
      theme = "";
      # Color Mode is:
      # 0 = 16-bit color palette from default theme,
      # 1 = Colors derived from track cover,
      # 2 = Colors derived from TrueColor theme,
      # Color Mode:
      colorMode = 0;
      # Terminal color theme is default.theme in
      # ~/.config/kew/themes (on Linux/FreeBSD/Android),
      # and ~/Library/Preferences/kew/themes (on macOS).
    };

    "track cover" = {
      coverEnabled = 1;
      coverAnsi = 0;
    };

    mouse.mouseEnabled = 1;
    discord.discordRPCEnabled = 1;

    visualizer = {
      visualizerEnabled = 1;
      visualizerHeight = 6;
      visualizerBrailleMode = 0;
      # How colors are laid out in the spectrum visualizer. 0=lighten, 1=brightness depending on bar height, 2=reversed, 3=reversed darken.
      visualizerColorType = 2;
      # 0=Thin bars, 1=Bars twice the width, 2=Auto (depends on window size).
      visualizerBarWidth = 2;
    };

    "progress bar" = {

      # Progress bar in track view
      # The progress bar can be configured in many ways.
      # When copying the values below, be sure to include values that are empty spaces or things will get messed up.
      # Be sure to have the actual uncommented values last.
      # For instance use the below values for a pill muncher mode:

      # progressBarElapsedEvenChar = "";
      # progressBarElapsedOddChar = "";
      # progressBarApproachingEvenChar = "•";
      # progressBarApproachingOddChar = "·";
      # progressBarCurrentEvenChar = "ᗧ";
      # progressBarCurrentOddChar = "ᗧ";

      # To have a thick line:

      progressBarElapsedEvenChar = "━";
      progressBarElapsedOddChar = "━";
      progressBarApproachingEvenChar = "━";
      progressBarApproachingOddChar = "━";
      progressBarCurrentEvenChar = "━";
      progressBarCurrentOddChar = "━";

      # To have dots (the original):

      # progressBarElapsedEvenChar = "■";
      # progressBarElapsedOddChar = "";
      # progressBarApproachingEvenChar = "=";
      # progressBarApproachingOddChar = "";
      # progressBarCurrentEvenChar = "■";
      # progressBarCurrentOddChar = "";

      # progressBarElapsedEvenChar = "━";
      # progressBarElapsedOddChar = "━";
      # progressBarApproachingEvenChar = "━";
      # progressBarApproachingOddChar = "━";
      # progressBarCurrentEvenChar = "━";
      # progressBarCurrentOddChar = "━";
    };

    "key bindings".bind = [
      "Space, playPause"
      "Shift+Tab, prevView"
      "Tab, nextView"
      "+, volUp, +5%"
      "=, volUp, +5%"
      "-, volDown, -5%"
      "h, prevSong"
      "l, nextSong"
      "k, scrollUp"
      "j, scrollDown"
      "p, playPause"
      "n, toggleNotifications"
      "v, toggleVisualizer"
      "b, toggleAscii"
      "r, toggleRepeat"
      "i, cycleColorMode"
      "t, cycleThemes"
      "c, cycleVisualization"
      "s, shuffle"
      "a, seekBack"
      "d, seekForward"
      "o, sortLibrary"
      "m, showLyricsPage"
      "Shift+s, stop"
      "x, exportPlaylist"
      "., addToFavorites_playlist"
      "u, updateLibrary"
      "f, moveSongUp"
      "g, moveSongDown"
      "Enter, enqueue"
      "Shift+g, enqueue"
      "Backspace, clearPlaylist"
      "Alt+Enter, enqueueAndPlay"
      "Left, prevSong"
      "Right, nextSong"
      "Up, scrollUp"
      "Down, scrollDown"
      "F2, showPlaylist"
      "F3, showLibrary"
      "F4, showTrack"
      "F5, showSearch"
      "F6, showHelp"
      "PgDn, nextPage"
      "PgUp, prevPage"
      "Del, remove"
      "mouseMiddle, enqueueAndPlay"
      "mouseRight, playPause"
      "mouseWheelDown, scrollDown"
      "mouseWheelUp, scrollUp"
      "q, quit"
      "Esc, quit"
      "Unknown, EVENT_NONE"
    ];
  };
in
{
  home.packages = [ pkgs.kew ];
  xdg.configFile."kew/kewrc".text = lib.generators.toINI { listsAsDuplicateKeys = true; } cfg;
}
