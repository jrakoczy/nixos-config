{ lib, ... }:

{
  networking = {
    
    wireless.enable = true;

    hostName = lib.mkDefault "nixos";
    nameservers = [ "8.8.8.8" "8.8.4.4" ];
  };
}
