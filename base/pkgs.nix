{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    calc
    cloc
    file
    git
    gnupg
    htop
    lshw
    lsof
    man_db
    manpages
    mtr
    nix-prefetch-scripts
    nix-repl
    unzip
    usbutils
    vim
    wget
    which
    whois
    zip
  ];

  security.setuidPrograms = ["mtr"];
}
