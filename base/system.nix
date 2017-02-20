{ lib, ... }:

{ 
  system = {

    autoUpgrade = {
    
      # A systemd service that runs nixos-rebuild switch --upgrade.
      enable = true; 

      # Define explicitly.
      channel = https://nixos.org/channels/nixos-16.09;
    };
    
    stateVersion = "16.09";
  };

  nix = {
    
    # build-cache-failure -- remember that a given build has failed.
    # auto-optimise-store -- hardlinks instead of duplicate store files. 
    # restrict-eval -- Nix evaluator doesn't have an access to files
    #                  outside the Nix search path (make sure that 
    #                  NIX_PATH is defined appropriately).
    extraOptions = ''
      build-cache-failure = true
      auto-optimise-store = true
      restrict-eval = true
    '';

    # Prevent from accessing dependencies from outside of the Nix store.
    useSandbox = true;
  };
  
  services.xserver = {
    enable = true;
    layout = lib.mkDefault "pl";
  };

  time.timeZone = "Europe/Warsaw"; 
}
