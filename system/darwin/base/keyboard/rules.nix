{
  home_to_ctrl_a = {
    description = "Home key to the beginning of the line (Control + a)";
    manipulators = [
      {
        type = "basic";
        from = {
          key_code = "home";
          modifiers = {
            optional = [ "any" ];
          };
        };
        to = [
          {
            key_code = "a";
            modifiers = [ "left_control" ];
          }
        ];
      }
    ];
  };
}
