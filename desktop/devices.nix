{ ... }:

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
}
