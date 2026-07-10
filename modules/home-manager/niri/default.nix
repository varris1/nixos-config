{ pkgs, inputs, ... }: {
  imports = [
    inputs.niri.homeModules.default
    inputs.niri.homeModules.stylix
    inputs.noctalia.homeModules.default

    ./settings.nix
    ./binds.nix
  ];

  home.packages = [
    pkgs.wl-clipboard-rs
    pkgs.xwayland-satellite
  ];

  programs.noctalia.enable = true;

  wayland.windowManager.niri = {
    enable = true;
    # validation.enable = false;
  };

}
