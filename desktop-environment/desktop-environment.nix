{ config, lib, pkgs, ... }:

{

services.displayManager = {
	defaultSession = "hyprland";
	sddm = {
		enable = true;
		wayland.enable = true;
	};
};

services.udev.extraRules = ''
	# idVendor and idProduct are obtained with lsusb (usbutils package)
	SUBSYSTEM=="input", ATTRS{idVendor}=="3434", ATTRS{idProduct}=="0353", ENV{ID_INPUT_JOYSTICK}="0"
'';

fonts = {
	enableDefaultPackages = true;
	packages = with pkgs; [
		# https://gitlab.com/fazzi/nixohess/-/blob/main/modules/core/fonts.nix
		noto-fonts
		noto-fonts-color-emoji
		noto-fonts-cjk-sans
		corefonts
		vista-fonts
		inter

		jetbrains-mono
	] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
};

}
