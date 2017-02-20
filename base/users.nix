{ ... }:

{
  # Disable imperative user management.
  users.mutableUsers = false;
  
  security.sudo.extraConfig = "Defaults timestamp_timeout=0";
}
