# Imports all base nix configuration files. Purely for convenience.
{ config, pkgs, ... }:

{
  imports =
    [ 
      ./base/all.nix
      ./hardware.nix
      ./passwords.nix
      ./system.nix
    ];
}
