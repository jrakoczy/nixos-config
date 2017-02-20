{ config, lib, pkgs, ... }:

{
  boot = {
    
    # The GRUB installation device. 
    loader.grub.device = "/dev/sda"; # Change to by-serial-id ref
   
    initrd = {
      luks.devices = [
        {
          name = "root";
          device = "/dev/disk/by-uuid/c4ddc6c8-60fb-4446-8722-d86e5f1ff9a5";
        }
      ];

      # Include all modules necessary for mounting the root device.
      availableKernelModules = [ "ata_piix" "ohci_pci" "sd_mod" "sr_mod" ];
     };
  };

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/dfffcb1f-e810-4129-b882-3793daee5839";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/D74E-7F65";
      fsType = "vfat";
    };

  swapDevices =
    [ 
      { device = "/dev/disk/by-uuid/c23e6b56-609f-42ad-9717-d64b5013fedc"; }
    ];

  virtualisation.virtualbox.guest.enable = true;
}


