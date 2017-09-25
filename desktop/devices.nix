{ pkgs, ... }:

let
  screenBrightness = "0.9";
in

{
  # Sound
  hardware.pulseaudio = {

    # Proxy all audio via the same sound server.
    # This way we standarize audio pipeline which tends to be
    # majorly confusing due to multitude of sound libs, servers and drivers.
    enable = true;

    # Include 32-bit Pulseaudio libs.
    # We need it in order for Wine to work.
    support32Bit = true;
  };

  # Display
  hardware.opengl = {

    # Support Direct Rendering for 32-bit apps.
    # We need it in order for Wine to work.
    driSupport32Bit = true;
  };

  fonts = {
      fonts = with pkgs; [
        roboto
        roboto-mono
      ];

      fontconfig = {
        defaultFonts = {
          sansSerif = [ "Roboto" ];
          monospace = [ "Roboto Mono" ];
        };
      };
   };

  services = {

    # Auto-adjust the screen's color temperature depending on the current time.
    redshift = {
      enable = true;
      latitude = "52.2";
      longitude = "21.0";
      brightness = {
        day = screenBrightness;
        night = screenBrightness;
      };
    };

    # Printing
    printing = {
      enable = true;

      # Printer drivers.
      gutenprint = true;
    };

  # Input devices
    xserver = {

      # Keyboard layout.
      layout = "pl";

      # Redefine key actions.
      xkbOptions = "ctrl:nocaps,compose:caps,rctrl:caps";

      # Make auto-repeat on key hold work faster.
      displayManager.xserverArgs = [
        "-ardelay 300"
        "-arinterval 20"
      ];

      # Touchpad support.
      libinput = {

        enable = true;

        # Left + right click emulates middle button.
        middleEmulation = true;

        naturalScrolling = true;
      };
    };

    logind.extraConfig = ''
      HandleLidSwitch=suspend
      HandlePowerKey=hibernate
    '';
  };

  # To make sure all local SSH sessions are closed after a laptop lid is shut.
  # Kudos to @michalrus.
  powerManagement.powerDownCommands = ''
    ${pkgs.procps}/bin/pgrep ssh | IFS= read -r pid; do
      [ "$(readlink "/proc/$pid/exe")" = "${pkgs.openssh}/bin/ssh" ] && kill "$pid"
    done
  '';
}
