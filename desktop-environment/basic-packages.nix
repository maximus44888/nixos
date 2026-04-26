{ config, lib, pkgs, ... }:

{

environment.systemPackages = with pkgs; [
	# Terminal emulator
	ghostty
	
	# Notifications
	mako
	libnotify
	
	# Status bar
	waybar

	# Application launcher
	rofi

	# Screenshots
	hyprshot

	# File manager
	kdePackages.dolphin

	# Authentification Agent
	hyprpolkitagent

	# Version control
	git
];

programs.neovim = {
	enable = true;
	defaultEditor = true;
	configure = {
		customRC = ''
			set tabstop=2
		'';
	};
};

}
