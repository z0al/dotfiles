{ pkgs, user, ... }:

{
  sound.enable = true;
  xdg.portal.enable = true;

  users.users.${user}.extraGroups = [ "audio" ];

  # Disable PulseAudio
  hardware.pulseaudio.enable = false;

  # Use Pipewire
  services.pipewire = {
    enable = true;

    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  security.rtkit.enable = true;
}
