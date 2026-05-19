{ pkgs, ... }:

{

environment.systemPackages = [ pkgs.difftastic ];

programs.git = {
	enable = true;
	config = {
		diff = {
			external = "difft";
		};
		alias = {
			dshow = "show --ext-diff";
			dlog = "log -p --ext-diff";
		};
	};
};

}
