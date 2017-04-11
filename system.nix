{ ... }:

{ 
  # Equal to a number of logical cores 
  nix.maxJobs = 4;

  # Remember to disable it:
  nixpkgs.config.allowBroken = true; 
}
