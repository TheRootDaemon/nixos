{
  pkgs,
  dotfiles,
  ...
}: {
  programs.neovim = {
    enable = true;

    # following options generate a `init.lua`
    # that is managed by the home-manager
    withNodeJs = true;
    withPython3 = true;

    extraPackages = with pkgs; [
      tree-sitter
    ];

    # let home-manager own `init.lua` instead of,
    # declaring it as a attribute in the following `home.file`
    # since the above options will create a home-manager owned file
    # even before creating a symlink, resulting in conflicts
    initLua = builtins.readFile "${dotfiles}/.config/nvim/init.lua";
  };

  # keeps `~/.config/nvim` a writable directory
  # also symlinking the lock file is not done
  # since it would make the lock file immutable
  # resulting in write fails when plugins are updated
  home.file = {
    ".config/nvim/after".source = "${dotfiles}/.config/nvim/after";
    ".config/nvim/lsp".source = "${dotfiles}/.config/nvim/lsp";
    ".config/nvim/lua".source = "${dotfiles}/.config/nvim/lua";
  };
}
