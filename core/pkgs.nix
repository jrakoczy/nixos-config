{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ag                      # Search for files
    calc
    cloc
    file
    fzf
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
    python3
    python3Packages.flake8
    python3Packages.isort
    python3Packages.neovim
    python3Packages.yapf
    shellcheck
    unzip
    usbutils
    wget
    which
    whois
    xclip
    zip
  ];

  programs = {
    tmux.enable = true;

    zsh = {
      enable = true;

      # A Zsh plugin manager.
      ohMyZsh.enable = true;
    };
  };

  # Mtr needs leveraged privileges.
  security.wrappers = {
    mtr.source = "${pkgs.mtr}/bin/mtr";
  };
}
