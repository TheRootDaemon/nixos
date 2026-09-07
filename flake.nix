{
  description = "therootdaemon's nixos configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-26.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  }: {
    nixosConfigurations.eiko = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [
        ./hosts/eiko/configuration.nix

        home-manager.nixosModules.home-manager

        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;

            backupFileExtension = "backup";

            extraSpecialArgs = {
              user = {
                name = "TheRootDaemon";
                email = "harsha.manjula.venkataramanan@gmail.com";
              };
            };

            users.therootdaemon = import ./home/users/therootdaemon/home.nix;
          };
        }
      ];
    };
  };
}
