{ config, lib, pkgs, ... }:

{

imports = [
	./basic-packages.nix
	./sound.nix
];

# Hyprland
programs.hyprland.enable = true;

# Login Screen
services.displayManager = {
	defaultSession = "hyprland";
	sddm = {
		enable = true;
		wayland.enable = true;
	};
};

# Disable Keyboard joystick input
services.udev.extraRules = ''
	# idVendor and idProduct are obtained with lsusb (usbutils package)
	SUBSYSTEM=="input", ATTRS{idVendor}=="3434", ATTRS{idProduct}=="0353", ENV{ID_INPUT_JOYSTICK}="0"
'';

# Fonts
fonts = {
	enableDefaultPackages = true;
	packages = with pkgs; [
		# https://gitlab.com/fazzi/nixohess/-/blob/main/modules/core/fonts.nix
		noto-fonts # Google Noto Fonts
		noto-fonts-color-emoji # Emoji Font
		noto-fonts-cjk-sans # Chinese, Japanese and Korean fonts
		corefonts # ms fonts
		vista-fonts # more ms fonts including calibri and consolas
		inter

		jetbrains-mono
	] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
};

}
