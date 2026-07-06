{
  fileSystems."/nix".neededForBoot = true;
  fileSystems."/persist".neededForBoot = true;

  fileSystems."/mnt/storage" = {
    device = "/dev/disk/by-id/nvme-WDS200T1X0E-00AFY0_21383Q802211_1-part1";
    fsType = "ext4";
  };

  disko.devices.nodev = {
    "/" = {
      fsType = "tmpfs";
      mountOptions = [
        "size=25%"
        "mode=755"
      ];
    };
  };

  disko.devices.disk.main = {
    device = "/dev/disk/by-id/nvme-WDS100T3X0C-00SJG0_2104BQ441903";
    type = "disk";
    content.type = "gpt";

    content.partitions.boot = {
      name = "ESP";
      size = "1G";
      type = "EF00";

      content = {
        type = "filesystem";
        format = "vfat";
        mountpoint = "/boot";
      };
    };

    content.partitions.swap = {
      size = "8G";
      content.type = "swap";
    };

    content.partitions.root = {
      name = "root";
      size = "100%";

      content = {
        type = "btrfs";
        extraArgs = [ "-f" ];

        subvolumes = {
          "/persist" = {
            mountOptions = [
              "subvol=persist"
              "compress=zstd"
            ];
            mountpoint = "/persist";
          };

          "/nix" = {
            mountOptions = [
              "subvol=nix"
              "compress=zstd"
            ];
            mountpoint = "/nix";
          };
        };
      };
    };
  };
}
