{
  pkgs,
  lib,
  inputs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ./stylix-shared.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 10;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "terra"; # Define your hostname.

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Vienna";

  services.udev.extraRules = /* udev */ ''
    #fixes instant wakeup on gigabyte mobos
    ACTION=="add" SUBSYSTEM=="pci" ATTR{vendor}=="0x1022" ATTR{device}=="0x1483" ATTR{power/wakeup}="disabled"
  '';

  fonts.packages = [
    pkgs.noto-fonts
    pkgs.noto-fonts-color-emoji
  ];

  services.printing.enable = true;

  services.avahi = {
    enable = true;
    nssmdns4 = true;
  };

  hardware.sane = {
    enable = true;
    extraBackends = [ pkgs.sane-airscan ];
  };

  services.udisks2.enable = true;
  security.polkit.enable = true;

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;

    extraConfig.pipewire."adjust-sample-rate" = {
      "default.clock.rate" = 48000;
      "default.clock.allowed-rates" = [
        44100
        48000
        88200
        96000
        176400
        192000
      ];
    };
  };

  security.sudo.enable = false;
  security.doas = {
    enable = true;
    extraRules = [
      {
        users = [ "manuel" ];
        keepEnv = false;
        persist = true;
      }
    ];
  };

  programs.dconf.enable = true;

  users.mutableUsers = false;
  users.users.manuel = {
    isNormalUser = true;
    # initialPassword = "12345";
    hashedPasswordFile = "/persist/passwords/password_manuel";
    extraGroups = [
      "uinput"
      "seat"
      "wheel"
      "networkmanager"
      "scanner"
      "lp"
    ];
    shell = pkgs.fish;
  };

  programs.fish.enable = true;

  programs.steam = {
    enable = true;
    package = pkgs.steam.override {
      extraEnv = {
        RADV_EXPERIMENTAL = "heap";
        PROTON_ENABLE_WAYLAND = 1;
        WAYLANDDRV_PRIMARY_MONITOR = "DP-1";
        PROTON_USE_WOW64 = 1;
      };
    };
  };
  hardware.steam-hardware.enable = true;
  hardware.uinput.enable = true;
  programs.gamescope = {
    enable = true;
    enableWsi = true;
    capSysNice = true;
  };

  services.power-profiles-daemon.enable = true;

  environment.systemPackages = with pkgs; [
    file
    fd
    helix
    lm_sensors
    ripgrep
  ];

  programs.mtr.enable = true;

  programs.git.enable = true;

  networking.firewall.enable = false;
  services.openssh.enable = true;

  hardware.enableRedistributableFirmware = true;
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.amdgpu.initrd.enable = true;

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-gnome
    ];
    config.common = {
      default = "gnome";
      # "org.freedesktop.impl.portal.AppChooser" = [ "gnome" ];
      # "org.freedesktop.impl.portal.OpenURI" = [ "gnome" ];
    };
  };

  programs.niri = {
    enable = true;
    withUWSM = true;
  };
  programs.noctalia-greeter.enable = true;

  programs.nix-ld.enable = true;

  services.seatd.enable = true;
  #services.kmscon.enable = true;

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
        ControllerMode = "bredr";
        Experimental = true;
        FastConnectable = true;
      };
    };
  };

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
    settings.auto-optimise-store = true;
    settings.warn-dirty = false;
    nixPath = lib.mapAttrsToList (name: flake: "${name}=${flake.outPath}") inputs;
    channel.enable = false;
  };

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = (_: true);
  };

  system.stateVersion = "26.05";
}
