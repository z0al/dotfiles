{ lib, ... }:

{
  config = {
    programs.claude-code = {
      enable = lib.mkDefault true;
      settings = {
        voiceEnabled = true;

        permissions = {
          allow = [
            "Bash(git diff:*)"
            "Bash(git log:*)"
            "Bash(git status:*)"
            "Bash(git show:*)"
            "Bash(git branch:*)"
            "Bash(git stash:*)"
            "Bash(git add:*)"
            "Bash(git commit:*)"
            "Bash(git checkout:*)"
            "Bash(git fetch:*)"
            "Bash(git pull:*)"
            "Bash(git merge:*)"
            "Bash(git rebase:*)"
            "Bash(ls:*)"
            "Bash(find:*)"
            "Bash(cat:*)"
            "Bash(grep:*)"
            "Bash(awk:*)"
            "Bash(sed:*)"
            "Bash(wc:*)"
            "Bash(sort:*)"
            "Bash(uniq:*)"
            "Bash(head:*)"
            "Bash(tail:*)"
            "Bash(diff:*)"
            "Bash(xargs:*)"
            "Bash(tr:*)"
            "Bash(cut:*)"
            "Bash(jq:*)"
            "Bash(npm:*)"
            "Bash(pnpm:*)"
            "Bash(bun:*)"
            "Bash(pip:*)"
            "Bash(uv:*)"
            "Bash(cargo:*)"
            "Bash(go:*)"
            "Bash(nix:*)"
            "Read"
          ];
          deny = [
            "Read(./.env)"
            "Read(./.env.*)"
            "Read(**/secrets/**)"
            "Read(~/.ssh/**)"
            "Read(~/.aws/**)"
          ];
        };
      };
    };

    home.shellAliases = {
      cl = "claude";
    };
  };
}
