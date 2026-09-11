{pkgs, ...}: {
  fonts.packages = with pkgs; [
    maple-mono.NF-unhinted
    nerd-fonts.noto
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-emoji
    noto-fonts-extra
  ];
}
