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

	# File manager
	nautilus

	# Authentification Agent
	hyprpolkitagent
];

programs = {
	git = {
		enable = true;
	};
	waybar = {
		enable = true;
	};
	neovim = {
		enable = true;
		defaultEditor = true;
		configure = {
			customRC = ''
				set shiftwidth=2
				set tabstop=2
			'';
		};
	};			
};

}
