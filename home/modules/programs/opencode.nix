{
  dotfiles,
  pkgsUnstable,
  ...
}: {
  # prefer latest releases
  home.packages = with pkgsUnstable; [
    opencode
  ];

  # symlinking the parent directory can cause conflicts
  # when OpenCode tries to write the files within it
  #
  # the parent symlink would point to a immutable nix store,
  # so when OpenCode tries to perform writes causing errors
  home.file = {
    ".config/opencode/agents".source = "${dotfiles}/.config/opencode/agents";
    ".config/opencode/skills".source = "${dotfiles}/.config/opencode/skills";

    ".config/opencode/opencode.jsonc".source = "${dotfiles}/.config/opencode/opencode.jsonc";
    ".config/opencode/tui.jsoc".source = "${dotfiles}/.config/opencode/tui.jsonc";
  };
}
