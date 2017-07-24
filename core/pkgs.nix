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
    neovim
    nix-prefetch-scripts
    nix-repl
    unzip
    usbutils
    wget
    which
    whois
    zip
  ];

  # Mtr needs leveraged privileges.
  security.wrappers = {
    mtr.source = "${pkgs.mtr}/bin/mtr";
  };
}
