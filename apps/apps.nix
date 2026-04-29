{ config, lib, pkgs, ... }:
{

programs.steam.enable = true;

environment.systemPackages = with pkgs; [
	brave
	discord
	qbittorrent
	(mpv.override { youtubeSupport = false; })
	syncplay
	prismlauncher
	code-cursor
	obs-studio
	xivlauncher
];

}
