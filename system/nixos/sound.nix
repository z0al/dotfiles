{
  sound.enable = true;
  xdg.portal.enable = true;

  my.user.extraGroups = [ "audio" ];

  # Disable PulseAudio
  hardware.pulseaudio = {
    enable = false;
    # package = pkgs.pulseaudioFull;
    # support32Bit = true;
  };

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
