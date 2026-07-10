{ pkgs, inputs, ... }: {
  programs.zen-browser = {
    enable = true;
    package = inputs.zen-browser.packages.x86_64-linux.twilight;
    setAsDefaultBrowser = true;
    profiles.nixos-profile = {
      settings = {
        "media.hardwaremediakeys.enabled" = false;
        "browser.translations.automaticallyPopup" = false;
        "zen.theme.gradient.show-custom-colors" = true;
      };

      extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
        bitwarden
        # blocktube
        darkreader
        dearrow
        istilldontcareaboutcookies
        return-youtube-dislikes
        sponsorblock
        startpage-private-search
        ublock-origin
        untrap-for-youtube
        violentmonkey
      ];

      mods = [
      ];
    };
  };
  stylix.targets.zen-browser.profileNames = [ "nixos-profile" ];
  # stylix.targets.zen-browser.enableCss = false;
}
