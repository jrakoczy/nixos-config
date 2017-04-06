{ lib, ... }:

{
  networking = {
    
    # Fixed DNS
    nameservers = [ "8.8.8.8" "8.8.4.4" ];
  };
}
