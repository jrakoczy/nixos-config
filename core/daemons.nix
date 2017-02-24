{ ... }:

{ 
  # An entropy deamon.
  services.haveged.enable = true;

  # Disable SSH keyring.
  ssh.startAgent = false;
}
