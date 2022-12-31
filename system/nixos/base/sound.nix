{ pkgs, ... }:

{
  sound.enable = true;

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
