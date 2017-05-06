{ pkgs, ... }:

{
  services.xserver = {
    enable = true;
    
    windowManager.i3 = {
      enable = true;

      # Use customized i3 version.
      package = pkgs.i3-gaps;
    };
  };
}
