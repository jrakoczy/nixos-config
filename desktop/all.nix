# Imports all configuration files that may be shared among different machines.
# Purely for convenience.
{ config, pkgs, ... }:

{
  imports =
    [
      ./devices.nix
      ./media.nix
      ./pkgs.nix
      ./system.nix
    ];
}
