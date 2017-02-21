{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    alsamixer
  ];
}
