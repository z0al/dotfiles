{ pkgs, user, ... }:

{
  users.users.${user} = {
    home = "/Users/${user}";
    shell = pkgs.fish;
  };

  # Apple menu > System Preferences > Users and Groups > Login Options
  system.defaults.loginwindow = {
    # Allow users to login to the machine as guests using the Guest
    # account. Default is true.
    GuestEnabled = false;

    # Hides the Restart button on the login screen. Default is false.
    RestartDisabled = true;

    # Hides the Shut Down button on the login screen. Default is false.
    ShutDownDisabled = true;

    # If set to true, the Power Off menu item will be disabled when the
    # user is logged in. Default is false.
    PowerOffDisabledWhileLoggedIn = true;
  };

  security.pam.enableSudoTouchIdAuth = true;
}
