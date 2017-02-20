# Imports all base nix configuration files. Purely for convenience.
{ config, pkgs, ... }:

{
  imports =
    [ 
      ./base/all.nix
      ./hardware.nix
      ./packages.nix
      ./passwords.nix
      ./system.nix
    ];
}
