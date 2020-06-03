{ pkgs, jrakoczyPkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    arandr
    arc-kde-theme
    arc-theme
    arc-icon-theme
    awscli
    cdrkit                   # CD/DVD utilities.
    chromium
    docker-compose
    drawio
    electrum
    evince
    ffmpeg-full
    gimp
    i3lock-fancy
    idea.idea-community
    keepassxc
    lemonbar-xft
    libreoffice
    lxappearance
    maven
    miraclecast              # stream image via wifi
    mpv
    networkmanager_dmenu
    nomacs
    octaveFull
    openjdk8
    pavucontrol              # Pulse audio settings.
    python2
    (
      python3.withPackages (
        python_pkgs: with python_pkgs; [
          boto3
        ]
      )
    )
    pywal                    # Generate colorschemes.
    rofi                     # A window switcher + run dialogue (substitutes dmenu).
    (
      texlive.combine {
        inherit (texlive) scheme-small beamer;
      }
    )
    scrot
    squirrel-sql
    termite
    # virtualbox
    visualvm
    # (wine.override { pulseaudioSupport = true; })
    # winetricks
    wmctrl
    xbanish                  # Hide a cursor when typing.
    xrandr-invert-colors
  ] ++ (with jrakoczyPkgs; [
    desktop-environment      # Manage dot-file the Nix way.
  ]);

  nixpkgs.config = {
    # Let's not be overzealous.
    allowUnfree = true;

    # This is necessary to make some streaming services work.
    chromium.enableWideVine = true;
  };

  # Grsecurity requires a process to have CAP_SYS_ADMIN
  # capabilities to create a new user namespace. Since
  # Chromium namesapces for sandboxing we need to use
  # a privileged helper.
  security.chromiumSuidSandbox.enable = true;
}
