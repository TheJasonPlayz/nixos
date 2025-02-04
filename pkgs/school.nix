{ pkgs, ... }: 

{
  environment.systemPackages = with pkgs; [
    geogebra6
  ];
}  