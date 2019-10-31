{ ... }:

{
  time.timeZone = "Europe/Warsaw";
  boot.loader = {
    grub.useOSProber = true;
    systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
  };
}
