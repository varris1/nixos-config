{ pkgs, ... }: {
  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;
    profiles.nixos-profile = {
      settings = {
        "media.hardwaremediakeys.enabled" = false;
        "browser.translations.automaticallyPopup" = false;
        "zen.theme.gradient.show-custom-colors" = true;
      };

      extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
        bitwarden
        darkreader
        return-youtube-dislikes
        sponsorblock
        startpage-private-search
        # blocktube
        untrap-for-youtube
        ublock-origin
        violentmonkey
      ];

      mods = [
      ];
    };
  };
  stylix.targets.zen-browser.profileNames = [ "nixos-profile" ];
  stylix.targets.zen-browser.enableCss = true;
}
