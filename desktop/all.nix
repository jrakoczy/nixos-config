# Imports all configuration files that may be shared among different machines.
# Purely for convenience.
{ config, pkgs, ... }:

{
  imports =
    [
      ./desktop.nix
      ./desktop-env.nix
      ./devices.nix
      ./networking.nix
      ./pkgs.nix
      ./system.nix
    ];
}
