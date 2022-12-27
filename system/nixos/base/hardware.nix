{
  hardware = {
    bluetooth.enable = true;
    video.hidpi.enable = true;

    # For MX Master 3 and others
    logitech.wireless = {
      enable = true;
      enableGraphical = true;
    };

    enableRedistributableFirmware = true;

    # Disable PulseAudio in favor of Pipewire
    pulseaudio.enable = false;
  };
}
