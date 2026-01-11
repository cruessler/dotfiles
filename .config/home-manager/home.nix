# This file was initially created following:
# https://nix-community.github.io/home-manager/index.xhtml
#
# Use `nix-channel --update; and home-manager switch` to update packages.
{ config, pkgs, ... }:

{
  home.username = "christoph";
  home.homeDirectory = "/home/christoph";

  home.stateVersion = "25.11";

  home.packages = [
    pkgs.broot
    pkgs.delta
    pkgs.difftastic
    pkgs.eza
    pkgs.fd
    pkgs.fzf
    pkgs.hyperfine
    pkgs.neovim
    pkgs.poop
    pkgs.ripgrep
    pkgs.samply
    pkgs.starship
    pkgs.stylua
    pkgs.tokei
    pkgs.zoxide

    pkgs.cargo-deny
    pkgs.cargo-diet
    pkgs.cargo-insta
    pkgs.cargo-nextest
    pkgs.cargo-sort
    pkgs.cargo-watch

    pkgs.khal
    pkgs.khard
    pkgs.vdirsyncer

    pkgs.zellij
  ];

  programs.home-manager.enable = true;
}
