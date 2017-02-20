{ ... }:

{
  environment.variables.PATH = [ "$HOME/.bin" ];  

  # We need to set NIX_PATH explicitly to make sure we have a full control
  # over Nix evaluator's access permissions (see: nix.extraOptions:restrict-eval).
  nix.nixPath = [
      "nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos/nixpkgs"
      "nixos-config=/etc/nixos/configuration.nix:/etc/nixos:/nix/var/nix/profiles/per-user/root/channels"
  ];
}
