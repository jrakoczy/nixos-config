# Imports all configuration files that may be shared among different machines.
# Purely for convenience.
{ config, pkgs, ... }:

{
  imports =
    [
      ./devices.nix
      ./media.nix
      ./networking.nix
      ./pkgs.nix
      ./system.nix
    ];
}
