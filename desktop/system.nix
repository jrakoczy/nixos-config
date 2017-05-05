{ ... }:

{
  time.timeZone = "Europe/Warsaw";
  
  # A suite of patches that make exploiting kernel bugs
  # more difficult.
  # This is a potential cause of various compatibility issues,
  # so bear in mind that in such cases this is the first place to 
  # look at.
  # TODO: currently set to `false` as grsecurity free support has 
  # been ceased.
  security.grsecurity.enable = false;
}
