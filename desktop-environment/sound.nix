{config, lib, pkgs, ...}:
{

# Realtime scheduler (useful for Pipewire performance)
security.rtkit.enable = true;

services.pipewire = {
	enable = true;

	# Load the echo cancellation module
	extraConfig.pipewire."99-echo-cancel" = {
		"context.modules" = [
			{
				name = "libpipewire-module-echo-cancel";
				args = {
					"library.name" = "aec/libspa-aec-webrtc";
					"node.name" = "Echo_Canceller";
					"node.description" = "Echo Canceller";
				};
			}
		];
	};
};

environment.systemPackages = with pkgs; [
	wiremix
	alsa-utils
	pwvucontrol
];

}
