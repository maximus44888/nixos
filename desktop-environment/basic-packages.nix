{ config, lib, pkgs, ... }:

{

environment.systemPackages = with pkgs; [
	# Terminal emulator
	ghostty
	
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

users.defaultUserShell = pkgs.zsh;

programs = {
	zsh = {
		enable = true;
	};
	git = {
		enable = true;
	};
	waybar = {
		enable = true;
	};
	yazi = {
		enable = true;
	};
};

}
