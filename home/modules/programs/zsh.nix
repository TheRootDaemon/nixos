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
      ga = "git add";
      gc = "git commit";
      gco = "git checkout";
      gl = "git log --oneline";
      gld = "git log --graph --decorate --pretty=format:'%C(auto)%h%d %s %C(dim white)(%cr)'";
      gs = "git status";
      gsw = "git switch";

      grep = "grep --color=auto";

      l = "ls -CF --color=auto";
      la = "ls -A --color=auto";
      ll = "ll -lah --color=auto";

      rg = "rg --color=auto";

      v = "nvim";

      x = "tmux new-session -s";
      xc = "tmux attach -t";
      xl = "tmus ls";
      xk = "tmux kill-server";
    };
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;

    settings = fromTOML (builtins.readFile "${dotfiles}/.config/starship.toml");
  };
}
