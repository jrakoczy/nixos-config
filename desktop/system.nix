{ ... }:

{
  time.timeZone = "Europe/Warsaw";
  
  # A suite of patches that make exploiting kernel bugs
  # more difficult.
  security.grsecurity.enable = true;
}
