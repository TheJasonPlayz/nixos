{ pkgs, ... }: 

{
  environment.systemPackages = with pkgs; [
    sageWithDoc
  ];
}  