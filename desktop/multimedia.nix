{ ... }:

{
  # Sound
  hardware.pulseaudio = {
    
    # Proxy all audio via the same sound server.
    # This way we standarize audio pipeline which tends to be
    # majorly confusing due to multitude of sound libs, servers and drivers.
    enable = true;

    # Include 32-bit Pulseaudio libs. Wine requires it.
    support32bit = true;
  } 
  
  # Display
  hardware = {
    
    # Support Direct Rendering for 32-bit apps.
    # Wine requires it.
    opengl.dirSupport32Bit = true;
  }
}
