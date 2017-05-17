{ ... }:

{ 

  # The maximum number of derivations that will be build in parallel.
  nix.maxJobs = 4;
  
  # Remember to disable it:
  nixpkgs.config.allowBroken = true; 
}
