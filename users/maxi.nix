{ config, lib, pkgs, ... }:

{

users.users.maxi = {
	isNormalUser = true;
	extraGroups = [ "networkmanager" "wheel" ];
};

}
