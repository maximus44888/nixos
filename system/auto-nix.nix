{ ... }: {

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

}
