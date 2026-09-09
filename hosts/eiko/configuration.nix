{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/denv
    ../../modules/system
  ];

  nix.settings.experimental-features = ["flakes" "nix-command"];

  networking.hostName = "eiko";
  networking.networkmanager.enable = true;

  users.users.therootdaemon = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "therootdaemon";
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [
    ];
  };

  programs.firefox.enable = true;
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
  };

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    zsh
    neovim
    starship
    python313
    python313Packages.pynvim
    fzf
    ripgrep
    oh-my-posh
    tldr
    tree
    tmux
    lua
    luarocks
    stylua
    lua-language-server
    ghostty
    go
    gofumpt
    gopls
    nodejs
    nixd
    alejandra
    wl-clipboard
  ];

  fonts.packages = with pkgs; [
    maple-mono.NF-unhinted
  ];

  system.stateVersion = "26.05";
}
