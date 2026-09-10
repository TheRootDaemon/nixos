{pkgs, ...}: {
  imports = [
    ./ghostty.nix
    ./git.nix
    ./neovim.nix
    ./opencode.nix
    ./ssh.nix
    ./tmux.nix
  ];

  home.packages = with pkgs; [
    curl
    fd
    fzf
    inetutils
    iputils
    less
    man-db
    ripgrep
    tlrc
    tree
    unzip
    wget
    wl-clipboard
  ];
}
