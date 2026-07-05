{ pkgs, inputs, ... }: {
  imports = [
    inputs.niri.homeModules.default
    inputs.niri.homeModules.stylix
    inputs.noctalia.homeModules.default

    ./settings.nix
    ./binds.nix
  ];

  home.packages = [ pkgs.xwayland-satellite ];

  programs.noctalia.enable = true;
  # stylix.targets.noctalia.enable = true;

  wayland.windowManager.niri = {
    enable = true;
    # validation.enable = false;
  };
}
