{ config, lib, pkgs, ... }: let
	nvimSrc =./nvim;
	nvimDst = ".config/nvim/";

	nvimRecursiveFiles = lib.filesystem.listFilesRecursive nvimSrc;

	nvimRecursiveFilesNoGit = builtins.filter (file:
		!(lib.strings.hasInfix "/.git/" (toString file))
	) nvimRecursiveFiles;

	nvimHjemUsersFiles = builtins.listToAttrs (map (file:
		let relativePath = lib.strings.removePrefix (toString nvimSrc + "/") (toString file);
		in {
			name = nvimDst + relativePath;
			value = { source = file; };
		}
	) nvimRecursiveFilesNoGit);
in {
	programs.neovim = {
		enable = true;
		defaultEditor = true;
		viAlias = true;
		vimAlias = true;
	};

	hjem.users.maxi.files = nvimHjemUsersFiles;
	hjem.users.root.files = nvimHjemUsersFiles;
}
