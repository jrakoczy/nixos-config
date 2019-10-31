{ config, lib, pkgs, ... }:

{
  imports =
    [ <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ "dm-snapshot" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  boot.initrd.luks.devices = [
    {
      name = "system";
      device = "/dev/disk/by-uuid/e44750dd-38a0-4b84-b90e-1b896e575b74";
    }
    {
      name = "data";
      device = "/dev/disk/by-uuid/70574997-1313-4099-a521-575620defb61";
    }
  ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/78c3adca-fd59-48f3-93fa-e3b93ff07ab4";
      fsType = "ext4";
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/efd9cadc-eacb-4e02-aae5-8fab364e0ec2";
      fsType = "ext4";
    };

  fileSystems."/data" =
    { device = "/dev/disk/by-uuid/a4179701-fc5a-44a2-91dc-480474489716";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/5A96-F549";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/876ec74c-ccf0-4358-911b-abc1050a5370"; }
    ];

  nix.maxJobs = lib.mkDefault 4;
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
}
