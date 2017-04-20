{ lib, ... }:

let

  # Defines when to perform system maintenance tasks such as
  # package updates and clean ups.
  maintenanceTime = "20:00";
in

{ 
  system = {

    autoUpgrade = {
    
      # A systemd service that runs nixos-rebuild switch --upgrade.
      enable = true;

      # Auto-upgrade time 
      dates = maintenanceTime; 

      # Define explicitly.
      channel = https://nixos.org/channels/nixos-16.09;
    };
   
    # Keep full control over package versions.
    # If we don't define it explicitly, it may turn out that we upgraded
    # some packaged to a version that is not backward compatible. 
    stateVersion = "17.03";
  };

  nix = {
    
    # build-cache-failure -- remember that a given build has failed.
    # auto-optimise-store -- hardlinks instead of duplicate store files. 
    # restrict-eval -- Nix evaluator doesn't have an access to files
    #                  outside the Nix search path (make sure that 
    #                  NIX_PATH is defined appropriately).
    extraOptions = ''
      auto-optimise-store = true
      restrict-eval = true
    '';

    # Prevent from accessing dependencies from outside of the Nix store.
    useSandbox = true;
    
    # Clean up old, unreferenced packages.
    gc = {
      automatic = true;
      dates = maintenanceTime;
      
      # Delete old and unused profile generations. 
      options = "--delete-older-than 60d"; 
    };
  };
}
