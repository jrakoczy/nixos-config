# Imports all configuration files that may be shared among different machines.
# Purely for convenience.
{ config, pkgs, jrakoczyPkgs, ... }:

{
  imports =
    [
      ./desktop-env.nix
      ./devices.nix
      ./networking.nix
      ./pkgs.nix
      ./system.nix
    ];
}
