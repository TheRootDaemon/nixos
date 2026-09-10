{dotfiles, ...}: {
  home.file.".config/opencode".source = "${dotfiles}/.config/opencode";
}
