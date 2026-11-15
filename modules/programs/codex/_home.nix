{ inputs, ... }:

{
  programs.codex = {
    marketplaces.mattpocock = inputs.matt-skills;
    settings.plugins."mattpocock-skills@mattpocock".enabled = true;
  };
}
