{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    davinci-resolve
    # natron
    tartube-yt-dlp
    inkscape
  ];
}