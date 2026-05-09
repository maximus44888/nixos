{ config, lib, pkgs, ... }:

{

imports = [
	./neovim.nix
];

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
};

}
