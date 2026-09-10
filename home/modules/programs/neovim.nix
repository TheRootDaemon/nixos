{
  pkgs,
  dotfiles,
  ...
}: {
  programs.neovim = {
    enable = true;

    withNodeJs = true;
    withPython3 = true;

    extraPackages = with pkgs; [
      tree-sitter
    ];
  };

  home.file.".config/nvim".source = "${dotfiles}/.config/nvim";
}
