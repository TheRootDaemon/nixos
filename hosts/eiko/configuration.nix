{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/denv
    ../../modules/devenv
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
    fzf
    ripgrep
    oh-my-posh
    tldr
    tree
    tmux
    ghostty
    wl-clipboard
  ];

  fonts.packages = with pkgs; [
    maple-mono.NF-unhinted
  ];

  system.stateVersion = "26.05";
}
