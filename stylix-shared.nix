{
  config,
  pkgs,
  ...
}:
{
  stylix = {
    enable = true;
    overlays.enable = false;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-hard.yaml";
    polarity = "dark";

    opacity.terminal = 0.9;
    opacity.applications = 0.9;

    cursor = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 32;
    };

    fonts = {
      sansSerif = {
        package = pkgs.noto-fonts;
        name = "Noto Sans";
      };

      serif = config.stylix.fonts.sansSerif;

      monospace = {
        package = pkgs.jetbrains-mono;
        name = "JetBrains Mono";
      };

      sizes = {
        applications = 11;
        desktop = 11;
        popups = 11;
        terminal = 11;
      };
    };
    icons = {
      enable = true;
      package = pkgs.gruvbox-plus-icons;
      dark = "Gruvbox Plus Dark";
    };
  };
}
