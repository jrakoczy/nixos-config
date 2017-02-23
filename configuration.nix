# Imports all base nix configuration files. Purely for convenience.
{ config, pkgs, ... }:

{
  imports =
    [ 
      ./core/all.nix
      ./hardware.nix
      ./passwords.nix
      ./system.nix
    ];
}
