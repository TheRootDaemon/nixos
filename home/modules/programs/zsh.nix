{
  config,
  dotfiles,
  ...
}: {
  programs.zsh = {
    enable = true;

    # zsh behaviour and safety options
    setOptions = [
      # disables beep sounds
      "NOBEEP"

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

    # edit current command in $EDITOR
    initContent = ''
      ZLE_RPROMPT_INDENT=0

      autoload -Uz edit-command-line
      zle -N edit-command-line
      bindkey "^[e" edit-command-line
    '';

    shellAliases = {
      d = "docker";
      dc = "docker compose";
      dps = ''
        docker ps -a --format "table {{.ID}}\t{{.Image}}\t{{.Names}}\t{{.Status}}\t{{.Ports}}"
      '';

      ff = ''
        fastfetch \
          --logo small \
          --structure title:separator:os:localip:kernel:display:de:wm:cpu:gpu:memory:swap:disk:battery:locale
      '';

      g = "git";
      ga = "git add";
      gc = "git commit";
      gcn = "git clone";
      gd = "git diff";
      gl = "git log --oneline";
      gld = "git log --graph --decorate --pretty=format:'%C(auto)%h%d %s %C(dim white)(%cr)'";
      gp = "git push";
      gpu = "git pull";
      gs = "git status";
      gsh = "git switch";

      grep = "grep --color=auto";

      ls = "eza -F";
      la = "eza -lhAF";
      tree = "eza --tree -F";

      oc = "opencode";

      rg = "rg --color=auto";

      v = "nvim";

      w = "tmux new-session -s";
      wc = "tmux attach -t";
      wls = "tmux ls";
      wk = "tmux kill-server";
    };
  };

  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      style = "compact";
      show_preview = true;

      auto_sync = false;
      sync_address = "";

      filter_mode = "directory";
      filter_mode_shell_up_key_binding = "directory";
    };
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = fromTOML (builtins.readFile "${dotfiles}/.config/starship.toml");
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    options = [
      "--cmd"
      "cd"
    ];
  };
}
