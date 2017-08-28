# Imports all configuration files that may be shared among different machines.
# Purely for convenience.
{ config, pkgs, ... }:

{
  imports =
    [
      ./daemons.nix
      ./env-variables.nix
      ./networking.nix
      ./system.nix
      ./pkgs.nix
      ./users.nix
    ];
}
