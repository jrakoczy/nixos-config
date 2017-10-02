# Imports all base nix configuration files. Purely for convenience.
{
  config,
  pkgs,
  ...
}:

{

  # Extend the list of arguments passed to imported modules.
  _module.args = {
    # Let's keep this in a separate namespace in case there were any package
    # name clashes.
    jrakoczyPkgs = import <jrakoczy-pkgs> {};
  };

  imports =
    [
      ./core/all.nix
      ./desktop/all.nix
      ./hardware.nix
      ./passwords.nix
      ./system.nix
      ./tmp-users.nix
    ];
}
