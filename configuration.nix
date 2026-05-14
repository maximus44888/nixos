{ config, lib, pkgs, ... }: let

currentDir = ./.;

directoryContents = builtins.readDir currentDir;

filtered = lib.filterAttrs (name: type:
	(lib.hasSuffix ".nix" name && name != "default.nix" && name != "configuration.nix")
	|| (type == "directory" && builtins.pathExists ( currentDir + "/${name}/default.nix"))
) directoryContents;

imports = lib.mapAttrsToList (name: _: currentDir + "/${name}") filtered;

in {

inherit imports;

boot.loader.systemd-boot.enable = true;
boot.loader.efi.canTouchEfiVariables = true;

time.timeZone = "Europe/Madrid";

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

services.xserver.xkb = {
	layout = "es";
	variant = "";
};

console.keyMap = "es";

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

system.stateVersion = "25.11";

}
