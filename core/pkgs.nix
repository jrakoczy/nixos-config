{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ag                      # Search for files.
    calc
    cloc
    file
    fzf                     # Fuzzy search.
    gettext                 # Contains envsubst and some localization utilities
    git
    gnupg
    htop
    lshw
    lsof
    man_db
    manpages
    mtr
    ncdu                    # Analyze disk usage.
    neovim
    nix-prefetch-scripts
    nix-repl
    python3
    python3Packages.flake8
    python3Packages.isort
    python3Packages.neovim
    python3Packages.yapf    # Code formatter.
    shellcheck
    sysstat                 # Performance monitoring (RAM, CPU usage, etc.).
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
    zsh.enable = true;
  };

  # Mtr needs leveraged privileges.
  security.wrappers = {
    mtr.source = "${pkgs.mtr}/bin/mtr";
  };
}
