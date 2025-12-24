{ config, pkgs, ... }:

{
  home.username = "christoph";
  home.homeDirectory = "/home/christoph";

  home.stateVersion = "25.11";

  home.packages = [
    pkgs.zellij
  ];

  programs.home-manager.enable = true;
}
