{ pkgs, ... }:

{

programs.steam.enable = true;

environment.systemPackages = with pkgs; [
	brave
	discord
	qbittorrent
	(mpv.override { youtubeSupport = false; })
	syncplay
	prismlauncher
];

programs = {
	obs-studio = {
		enable = true;
	};
};

}
