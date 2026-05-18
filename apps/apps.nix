{ pkgs, ... }:

{

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
	steam = {
		enable = true;
		extraCompatPackages = with pkgs; [
			proton-ge-bin
		];
	};
};

}
