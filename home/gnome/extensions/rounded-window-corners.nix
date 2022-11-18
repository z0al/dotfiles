{
  dconf.settings."org/gnome/shell/extensions/rounded-window-corners" = {
    skip-libadwaita-app = true;
    skip-libhandy-app = true;

    global-rounded-corner-settings = {
      _type = "gvariant";
      type = "";
      value = "{'padding': <{'left': <uint32 1>, 'right': <uint32 1>, 'top': <uint32 1>, 'bottom': <uint32 1>}>, 'keep_rounded_corners': <{'maximized': <false>, 'fullscreen': <false>}>, 'border_radius': <uint32 8>, 'smoothing': <uint32 1>, 'enabled': <true>}";
      __toString = self:
        "@a{sv} ${self.value}";
    };
  };
}
