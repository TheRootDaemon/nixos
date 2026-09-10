{
  description = "@TheRootDaemon's nixos configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-26.05";
    dotfiles.url = "github:TheRootDaemon/dotfiles";
    home-manager = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/home-manager/release-26.05";
    };
  };

  outputs = {
    self,
    nixpkgs,
    dotfiles,
    home-manager,
    ...
  }: let
    # hosts managed by this flake
    hosts = {
      eiko = {
        system = "x86_64-linux";
        modules = [./hosts/eiko/configuration.nix];
      };
    };

    # user information shared across the configuration
    profile = {
      userName = "TheRootDaemon";
      unixUserName = "therootdaemon";
      userEmail = "harsha.manjula.venkataramanan@gmail.com";
    };
  in {
    nixosConfigurations.eiko = nixpkgs.lib.nixosSystem {
      system = hosts.eiko.system;
      modules =
        hosts.eiko.modules
        ++ [
          home-manager.nixosModules.home-manager

          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;

              backupFileExtension = "backup";

              extraSpecialArgs = {
                inherit profile dotfiles;
              };

              users.${profile.unixUserName} = import ./home/users/${profile.unixUserName}/home.nix;
            };
          }
        ];
    };
  };
}
