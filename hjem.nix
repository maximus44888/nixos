# Adding hjem for managing $HOME config files.
# Since I'm not using flakes, this is the way to get it working.
# Courtesy of choco98 - https://discord.com/channels/961691461554950145/1233827370855694426/1502331749722489123
let hjem-src = builtins.fetchTarball {
	url = "https://github.com/feel-co/hjem/archive/main.tar.gz";
	sha256 = "sha256:1jmrszlchrg08jwdpxmvccj8qhk8w7pnfb1yx3f0h046ys8d38c1";
};
in (import "${hjem-src}/modules/nixos/default.nix").hjem
