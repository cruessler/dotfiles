{ config, pkgs, ... }:

{
  home.username = "christoph";
  home.homeDirectory = "/home/christoph";

  home.stateVersion = "25.11";

  home.packages = [
    pkgs.khal
    pkgs.khard
    pkgs.vdirsyncer

    pkgs.zellij
  ];

  programs.home-manager.enable = true;
}
