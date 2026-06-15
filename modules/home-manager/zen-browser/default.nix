{ inputs, ... }: {
  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;
    profiles.nixos-profile = {
      settings = {
        "media.hardwaremediakeys.enabled" = false;
        "browser.translations.automaticallyPopup" = false;
        "zen.theme.gradient.show-custom-colors" = true;
      };

      extensions.packages = with inputs.firefox-addons.packages.x86_64-linux; [
        bitwarden
        blocktube
        darkreader
        return-youtube-dislikes
        sponsorblock
        startpage-private-search
        ublock-origin
        violentmonkey
      ];

      mods = [
      ];
    };
  };
  stylix.targets.zen-browser.profileNames = [ "nixos-profile" ];
  stylix.targets.zen-browser.enableCss = true; # needed to get transparent zen working
}
