{ pkgs, ... }:

{
  environment.systemPackages = with pkgs.latest; [
    trash-cli
  ];

  environment.variables = {
    # Works around "gio trash" issues when using a tmpfs for
    # electron-based apps e.g. VS Code
    ELECTRON_TRASH = "trash-cli";
  };
}
