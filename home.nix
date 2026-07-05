{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    inputs.nix-index-database.homeModules.default
    inputs.zen-browser.homeModules.default

    ./stylix-shared.nix
    ./modules/home-manager
  ];
  qt.enable = true;

  programs.imv.enable = true;

  programs.discord.enable = true;

  programs.nix-index.enable = true;
  programs.nix-index-database.comma.enable = true;

  programs.fzf.enable = true;
  programs.bat.enable = true;
  programs.btop.enable = true;
  programs.ripgrep.enable = true;

  programs.nh = {
    enable = true;
    flake = "${config.home.homeDirectory}/.nixconf";
  };

  services.kdeconnect = {
    enable = true;
    indicator = true;
  };

  home.packages = [
    inputs.noctalia.packages.x86_64-linux.default

    pkgs.openmw
    pkgs.pavucontrol
  ];

  stylix.targets.blender.enable = false;
  stylix.targets.vencord.enable = false;

  home.stateVersion = "26.05";
}
