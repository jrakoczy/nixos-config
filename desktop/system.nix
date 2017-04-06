{ ... }:

{
  time.timeZone = "Europe/Warsaw";
  
  # A suite of patches that make exploiting kernel bugs
  # more difficult.
  # This is a potential cause of various compatibility issues,
  # so bear in mind that in such cases this is the first place to 
  # look at.
  security.grsecurity.enable = true;
}
