{ ... }:

{
  environment.variables.PATH = [ "$HOME/.bin" ];

  # We need to set NIX_PATH explicitly to make sure we have a full control
  # over Nix evaluator's access permissions (see: nix.extraOptions:restrict-eval).
  nix.nixPath = [
    "/nix/store"
    "nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos"
    "nixos-config=/etc/nixos/configuration.nix:/etc/nixos:/nix/var/nix/profiles/per-user/root/channels"
    "jrakoczy-pkgs=https://github.com/jrakoczy/aux-nixpkgs/archive/master.tar.gz"
  ];
}
