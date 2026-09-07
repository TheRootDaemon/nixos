{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/denv/xserver.nix
    ../../modules/denv/gnome.nix
  ];

  nix.settings.experimental-features = ["flakes" "nix-command"];

  boot.loader.systemd-boot.enable = false;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    device = "nodev";
  };

  networking.hostName = "eiko";
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Kolkata";
  i18n.defaultLocale = "en_IN";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

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
