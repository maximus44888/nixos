{ config, lib, pkgs, ... }:

let hypr = (toString ./hypr);
in {

programs.hyprland.enable = true;

hjem.users.maxi.files.".config/hypr".source = hypr;

}
