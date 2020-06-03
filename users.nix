{ pkgs, ... }:

let
  isNormalUser = true;
  coreGroups = [ "networkmanager" "video" "docker" ];
  sudoGroups = coreGroups ++ [ "wheel" ];
  shell = pkgs.zsh;
in

{
  users.extraUsers.kuba = {
    inherit isNormalUser shell;
    home = "/home/kuba";
    extraGroups = sudoGroups;
  };

  nix.trustedUsers = [ "@wheel" ];
}
