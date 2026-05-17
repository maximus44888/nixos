{ config, lib, pkgs, ... }:

{

environment.systemPackages = with pkgs; [
	# Terminal emulator
	kitty
	
	# Notifications
	mako
	libnotify
	
	# Application launcher
	rofi

	# Screenshots
	hyprshot

	# Authentification Agent
	hyprpolkitagent

	# Clipboard
	wl-clipboard
	cliphist
];

programs = {
	git = {
		enable = true;
	};
	waybar = {
		enable = true;
	};
	yazi = {
		enable = true;
	};
	zoxide = {
		enable = true;
		flags = [
			"--cmd cd"
		];
	};
};

}
