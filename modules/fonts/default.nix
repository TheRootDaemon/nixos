{pkgs, ...}: {
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.noto
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
  ];
}
