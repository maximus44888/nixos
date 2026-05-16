{ lib, ... } : let

currentDir = ./.;

directoryContents = builtins.readDir currentDir;

filtered = lib.filterAttrs (name: type:
	(lib.hasSuffix ".nix" name && name != "default.nix")
	|| (type == "directory" && builtins.pathExists ( currentDir + "/${name}/default.nix"))
) directoryContents;

imports = lib.mapAttrsToList (name: _: currentDir + "/${name}") filtered;

in { inherit imports; }

