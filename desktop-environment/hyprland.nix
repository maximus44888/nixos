{ config, lib, pkgs, ... }:

{

programs.hyprland.enable = true;

hjem.users.maxi.files.".config/hypr".source = ./hypr;

}
