{ ... }:

{ 
  # An entropy deamon.
  services.haveged.enable = true;

  # Disable SSH keyring.
  programs.ssh.startAgent = false;
}
