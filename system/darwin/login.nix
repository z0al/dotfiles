{ pkgs, user, ... }:

{
  users.users.${user} = {
    description = "Ahmed";
    home = "/Users/${user}";
    shell = pkgs.fish;
  };

  system.defaults.loginwindow = {
    GuestEnabled = false;
    RestartDisabled = true;
    ShutDownDisabled = true;
    PowerOffDisabledWhileLoggedIn = true;
  };
}
