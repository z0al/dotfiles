{ inputs, ... }:

{
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./options.nix
    ./keymaps.nix
    ./plugins.nix
    ./statusline.nix
  ];

  programs.nixvim = {
    nixpkgs.useGlobalPackages = true;
    defaultEditor = true;
    vimAlias = true;
    colorschemes.poimandres.enable = true;
  };
}
