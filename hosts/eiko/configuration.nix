{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/fonts
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

  programs.zsh.enable = true;

  nixpkgs.config.allowUnfree = true;
}
