{
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    inputs.niri.homeModules.default
    inputs.niri.homeModules.stylix

    ./settings.nix
    ./binds.nix
  ];

  stylix.targets.niri.enable = true;
  home.packages = [ pkgs.xwayland-satellite ];

  wayland.windowManager.niri = {
    enable = true;
    # validation.enable = false;
  };
}
