{ ... }:

{
  users.extraUsers.kuba = {
    isNormalUser = true;
    home = "/home/kuba";
    extraGroups = [ "wheel" "networkmanager" ];
  }


  users.extraUsers.root = {
    isNormalUser = true;
    home = "/root";
    extraGroups = [ "wheel" "networkmanager" ];
  }

  nix.trustedUsers = [ "@wheel" ];
}
