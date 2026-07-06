let
  commonMountOptions = [
    "x-gvfs-hide"
    "x-gdu.hide"
  ];
in
{
  boot.tmp.cleanOnBoot = true;

  preservation = {
    enable = true;

    preserveAt."/persist" = {
      inherit commonMountOptions;

      files = [
        {
          file = "/etc/machine-id";
          inInitrd = true;
        }
      ];

      directories = [
        {
          directory = "/tmp";
          mode = "1777";
        }
        "/var/lib/nixos"
        "/var/lib/systemd/timers"
        "/var/log"
        "/var/lib/bluetooth"
        "/etc/NetworkManager/system-connections"
        "/var/lib/noctalia-greeter"
      ];

      users.manuel = {
        inherit commonMountOptions;

        files = [
        ];

        directories = [
          "Downloads"
          "Pictures"
          "Repos"
          ".nixconf"

          ".config/discord"
          ".config/kdeconnect"
          ".config/kew"
          ".config/qobuz-dl"
          ".config/zen"

          ".local/share/fish"
          ".local/share/zoxide"

          ".local/state/noctalia"
          ".local/state/wireplumber"

          #Games
          ".local/share/Steam"
          ".steam"
          ".factorio"
          ".config/EgoSoft"
        ];
      };
    };

    preserveAt."/mnt/storage/persist" = {
      users.manuel = {
        inherit commonMountOptions;

        directories = [
          "Music"
        ];
      };
    };
  };
  systemd.suppressedSystemUnits = [ "systemd-machine-id-commit.service" ];
}
