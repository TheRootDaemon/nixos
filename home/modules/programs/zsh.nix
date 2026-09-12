{
  config,
  dotfiles,
  ...
}: {
  programs.zsh = {
    enable = true;

    # zsh behaviour and safety options
    setOptions = [
      # error when glob mathes no files
      "NOMATCH"

      # waits before executing "rm *" commands
      "RM_STAR_WAIT"

      # stores timestamps and command duration in the history
      "EXTENDED_HISTORY"
    ];

    history.size = 1000000;
    history.save = 1000000;
    history.path = "${config.home.homeDirectory}/.zsh_history";

    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      g = "git";
      ga = "git add";
      gc = "git commit";
      gco = "git checkout";
      gl = "git log --oneline";
      gld = "git log --graph --decorate --pretty=format:'%C(auto)%h%d %s %C(dim white)(%cr)'";
      gp = "git push";
      gpl = "git pull";
      gr = "git rebase";
      grs = "git restore";
      gs = "git status";
      gst = "git stash";
      gsw = "git switch";

      grep = "grep --color=auto";

      l = "ls -CF --color=auto";
      la = "ls -A --color=auto";
      ll = "ls -lah --color=auto";

      rg = "rg --color=auto";

      v = "nvim";

      w = "tmux new-session -s";
      wc = "tmux attach -t";
      wl = "tmus ls";
      wk = "tmux kill-server";
    };
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;

    settings = fromTOML (builtins.readFile "${dotfiles}/.config/starship.toml");
  };
}
