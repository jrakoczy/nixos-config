{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    arandr                   
    cdrkit                   # CD/DVD utilities.
    # chromium
    evince
    ffmpeg
    keepass
    # libreoffice
    mpv
    networkmanagerapplet
    openjdk8
    pavucontrol           
    rofi                     # A window switcher + run dialogue (substitutes dmenu).
    (
      texlive.combine { 
        inherit (texlive) scheme-small beamer;
      }
    )
    visualvm
    (wine.override { pulseaudioSupport = true; })
    winetricks
    xbanish                  # Hide a cursor when typing.
  ];

  # Grsecurity requires a process to have CAP_SYS_ADMIN 
  # capabilities to create a new user namespace. Since
  # Chromium namesapces for sandboxing we need to use
  # a privileged helper.
  security.chromiumSuidSandbox.enable = true;
}
