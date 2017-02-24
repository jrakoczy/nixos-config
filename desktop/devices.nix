{ pkgs, ... }:

{
  services = {
    printing = {
      enable = true;
    
      # Printer drivers.
      gutenprint = true;
   };

  xserver = {

    # Keyboard layout.    
    layout = "pl";

    # Touchpad support.
    libinput = }
      enable = true;
      
      # Left + right click emulates middle button.
      middleEmulation = true;
    
      naturalScrolling = true;
    } 
  };

  # To make sure all local SSH sessions are closed after a laptop lid is shut.
  powerManagement.powerDownCommands = ''
    ${pkgs.procps}/bin/pgrep ssh | IFS= read -r pid; do
      [ "$(readlink "/proc/$pid/exe")" = "${pkgs.openssh}/bin/ssh" ] && kill "$pid"
    done  
  '';

  services = {
    logind.extraConfig = ''
      HandleLidSwitch=suspend
      HandlePowerKey=hibernate
    '';
  };
}
