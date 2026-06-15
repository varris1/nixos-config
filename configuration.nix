# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  config,
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

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 10;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "terra"; # Define your hostname.

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Vienna";

  services.udev.extraRules = ''
    ACTION=="add" SUBSYSTEM=="pci" ATTR{vendor}=="0x1022" ATTR{device}=="0x1483" ATTR{power/wakeup}="disabled"
  '';

  fonts.packages = [
    pkgs.noto-fonts
    pkgs.noto-fonts-color-emoji
  ];

  # Enable CUPS to print documents.
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

  # Enable sound.
  # services.pulseaudio.enable = true;
  # OR
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

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.root.hashedPasswordFile = "/etc/nixos/secrets/passwordfile_root.txt";
  users.users.manuel = {
    isNormalUser = true;
    hashedPasswordFile = "/etc/nixos/secrets/passwordfile_manuel.txt";
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

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    fd
    helix
    lm_sensors
    ripgrep
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  programs.git.enable = true;

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

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
  programs.noctalia-greeter = {
    enable = true;
    settings.cursor = {
      theme = config.stylix.cursor.name;
      size = config.stylix.cursor.size;
      package = config.stylix.cursor.package;
    };
  };

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
    nixPath = lib.mapAttrsToList (name: flake: "${name}=${flake.outPath}") inputs;
    channel.enable = false;
  };

  nixpkgs.config.allowUnfree = true;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "26.05"; # Did you read the comment?
}
