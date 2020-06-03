{ ... }:

{
  time.timeZone = "Europe/Warsaw";
  boot.loader = {
    grub.useOSProber = true;
    systemd-boot = {
      enable = true;
      configurationLimit = 2;
    };
    efi.canTouchEfiVariables = true;
  };
  virtualisation.docker.enable = true;
}
