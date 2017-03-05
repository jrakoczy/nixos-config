{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    arandr                   
    cdrkit                   # CD/DVD utilities.
    chromium
    evince
    ffmpeg
    keepass
    libreoffice
    networkmanagerapplet
    openjdk8
    pavucontrol           
    rofi                     # A window switcher + run dialogue (substitutes dmenu).
    texLive
    texLiveBeamer
    visualvm
    (wine.override { pulseaudioSupport = true; })
    winetricks
    xbanish                  # Hide a cursor when typing.
  ];
}
