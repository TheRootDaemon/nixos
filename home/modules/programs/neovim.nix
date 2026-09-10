{dotfiles, ...}: {
  programs.tmux = {
    enable = true;
    extraLuaConfig = builtins.readFile "${dotfiles}/.config/nvim/init.lua";
  };
}
