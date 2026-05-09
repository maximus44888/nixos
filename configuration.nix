# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, ... }:

# Adding hjem for managing $HOME config files.
# Since I'm not using flakes, this is the way to get it working.
# Courtesy of choco98 - https://discord.com/channels/961691461554950145/1233827370855694426/1502331749722489123
let
hjem-src = builtins.fetchTarball {
	url = "https://github.com/feel-co/hjem/archive/main.tar.gz";
	sha256 = "sha256:1jmrszlchrg08jwdpxmvccj8qhk8w7pnfb1yx3f0h046ys8d38c1";
};

hjem-module = (import "${hjem-src}/modules/nixos/default.nix").hjem;
in

{

imports = [
	./hardware-configuration.nix
	./desktop-environment/desktop-environment.nix
	./apps/apps.nix
	hjem-module
];

# Bootloader.
boot.loader.systemd-boot.enable = true;
boot.loader.efi.canTouchEfiVariables = true;

# Set your time zone.
time.timeZone = "Europe/Madrid";

# Select internationalisation properties.
i18n.defaultLocale = "en_US.UTF-8";

i18n.extraLocaleSettings = {
	LC_ADDRESS = "es_ES.UTF-8";
	LC_IDENTIFICATION = "es_ES.UTF-8";
	LC_MEASUREMENT = "es_ES.UTF-8";
	LC_MONETARY = "es_ES.UTF-8";
	LC_NAME = "es_ES.UTF-8";
	LC_NUMERIC = "es_ES.UTF-8";
	LC_PAPER = "es_ES.UTF-8";
	LC_TELEPHONE = "es_ES.UTF-8";
	LC_TIME = "es_ES.UTF-8";
};

# Configure keymap in X11
services.xserver.xkb = {
	layout = "es";
	variant = "";
};

# Configure console keymap
console.keyMap = "es";

# Define a user account. Don't forget to set a password with ‘passwd’.
users.users.maxi = {
	isNormalUser = true;
	description = "Maxi";
	extraGroups = [ "networkmanager" "wheel" ];
	packages = with pkgs; [];
};

# Allow unfree packages
nixpkgs.config.allowUnfree = true;

nix = {
	gc = {
		automatic = true;
		dates = [ "weekly" ];
		options = "--delete-older-than 14d";
	};
	optimise = {
		automatic = true;
		dates = [ "weekly" ];
	};
};

system.autoUpgrade = {
	enable = true;
	allowReboot = true;
	dates = "daily";
};

boot.kernelPackages = pkgs.linuxPackages_latest;

hardware.enableAllFirmware = true;

# Some programs need SUID wrappers, can be configured further or are
# started in user sessions.
# programs.mtr.enable = true;
# programs.gnupg.agent = {
#   enable = true;
#   enableSSHSupport = true;
# };

# List services that you want to enable:

# Enable the OpenSSH daemon.
# services.openssh.enable = true;

# Open ports in the firewall.
# networking.firewall.allowedTCPPorts = [ ... ];
# networking.firewall.allowedUDPPorts = [ ... ];
# Or disable the firewall altogether.
# networking.firewall.enable = false;

# This value determines the NixOS release from which the default
# settings for stateful data, like file locations and database versions
# on your system were taken. It‘s perfectly fine and recommended to leave
# this value at the release version of the first install of this system.
# Before changing this value read the documentation for this option
# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
system.stateVersion = "25.11"; # Did you read the comment?

}
