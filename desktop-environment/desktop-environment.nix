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
fonts.packages = [
	pkgs.jetbrains-mono
]
++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);

}
