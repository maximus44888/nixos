{ config, lib, pkgs, ... }:

let nvim = (toString ./nvim);
in {

programs.neovim = {
	enable = true;
	defaultEditor = true;
	viAlias = true;
	vimAlias = true;
};

hjem.users.root.files.".config/nvim".source = nvim;
hjem.users.maxi.files.".config/nvim".source = nvim;

}
