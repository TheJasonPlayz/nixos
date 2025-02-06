{ pkgs, lib, config, ... }:

{
  sage = pkgs.sage.sage-with-env.sage-env.overrideAttrs (finalAttrs: prevAttrs: {
    
  });
}