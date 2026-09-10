{dotfiles, ...}: {
  programs.neovim = {
    enable = true;
    initLua = builtins.readFile "${dotfiles}/.config/nvim/init.lua";
  };
}
