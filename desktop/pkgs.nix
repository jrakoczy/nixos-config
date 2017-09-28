{ pkgs, jrakoczyPkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    arandr
    cdrkit                   # CD/DVD utilities.
    chromium
    evince
    ffmpeg
    # keepass
    lemonbar-xft
    # libreoffice
    mpv
    networkmanagerapplet
    # openjdk8
    pavucontrol
    rofi                     # A window switcher + run dialogue (substitutes dmenu).
    (
      texlive.combine {
        inherit (texlive) scheme-small beamer;
      }
    )
    scrot
    termite
    visualvm
    # (wine.override { pulseaudioSupport = true; })
    # winetricks
    wmctrl
    xbanish                  # Hide a cursor when typing.
    xrandr-invert-colors
  ] ++ (with jrakoczyPkgs; [
    desktop-environment      # Manage dot-file the Nix way.
    pywal                      # Adjust colorscheme to wallpaper
  ]);

  # Grsecurity requires a process to have CAP_SYS_ADMIN
  # capabilities to create a new user namespace. Since
  # Chromium namesapces for sandboxing we need to use
  # a privileged helper.
  security.chromiumSuidSandbox.enable = true;
}
