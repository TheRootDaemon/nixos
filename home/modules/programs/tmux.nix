{dotfiles, ...}: {
  programs.tmux = {
    enable = true;
    extraConfig = builtins.readFile "${dotfiles}/.config/tmux/tmux.conf";
  };
}
