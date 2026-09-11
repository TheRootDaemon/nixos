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

  system.stateVersion = "26.05";
  documentation.nixos.enable = false;
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

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
  };

  nixpkgs.config.allowUnfree = true;

  fonts.packages = with pkgs; [
    maple-mono.NF-unhinted
  ];
}
