{ lib, ... }:

{
  config = {
    programs.claude-code = {
      enable = lib.mkDefault true;
      settings = {
        voiceEnabled = true;

        attribution = {
          commit = "";
          pr = "";
          sessionUrl = false;
        };

        permissions = {
          defaultMode = "acceptEdits";

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
            "Bash(git rm:*)"
            "Bash(git reset:*)"
            "Bash(git restore:*)"
            "Bash(git mv:*)"
            "Bash(ls:*)"
            "Bash(find:*)"
            "Bash(cat:*)"
            "Bash(grep:*)"
            "Bash(rg:*)"
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
            "Bash(echo:*)"
            "Bash(mkdir:*)"
            "Bash(mv:*)"
            "Bash(touch:*)"
            "Bash(chmod:*)"
            "Bash(cd:*)"
            "Bash(gh:*)"
            "Bash(curl:*)"
            "Bash(python:*)"
            "Bash(python3:*)"
            "Bash(perl:*)"
            "Bash(poetry:*)"
            "Bash(nixfmt:*)"
            "Bash(nix-store:*)"
            "Bash(nix-instantiate:*)"
            "Bash(nix-prefetch-url:*)"
            "Bash(npm:*)"
            "Bash(pnpm:*)"
            "Bash(npx:*)"
            "Bash(bun:*)"
            "Bash(pip:*)"
            "Bash(uv:*)"
            "Bash(cargo:*)"
            "Bash(go:*)"
            "Bash(make:*)"
            "Bash(docker:*)"
            "Bash(sqlite3:*)"
            "Bash(pkill:*)"
            "Bash(lsof:*)"
            "Bash(source:*)"
            "Bash(nix:*)"
            "Read"
            "Edit"
            "Write(*)"
            "WebSearch"
            "WebFetch(domain:github.com)"
            "WebFetch(domain:gist.github.com)"
          ];
          deny = [
            "Read(**/.env*)"
            "Read(**/.dev.vars*)"
            "Read(**/*.pem)"
            "Read(**/*.key)"
            "Read(**/secrets/**)"
            "Read(**/credentials/**)"
            "Read(**/.aws/**)"
            "Read(**/.ssh/**)"
            "Read(**/config/database.yml)"
            "Read(**/config/credentials.json)"
            "Read(**/.npmrc)"
            "Read(**/.pypirc)"
            "Edit(**/.env*)"
            "Edit(**/secrets/**)"
            "Edit(**/.ssh/**)"
          ];
        };
      };
    };

    home.shellAliases = {
      cl = "claude";
    };
  };
}
