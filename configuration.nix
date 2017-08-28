# Imports all base nix configuration files. Purely for convenience.
{
  config,
  pkgs,
  ...
}:

let

  # Let's keep this in a separate namespace in case there were any package
  # name clashes.
  jrakoczyPkgs = import <jrakoczy-pkgs> {};
in
{
  imports =
    [
      ./core/all.nix
      ./desktop/all.nix
      ./hardware.nix
      ./passwords.nix
      ./system.nix
    ];
}
