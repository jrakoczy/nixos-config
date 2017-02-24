{ lib, ... }:

{
  networking = {
    hostName = lib.mkDefault "nixos";
    
    # Fixed DNS
    nameservers = [ "8.8.8.8" "8.8.4.4" ];
  };
}
