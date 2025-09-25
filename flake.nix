{
  description = "Corentin's Nixos configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.05";
    home-manager = { 
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in
  {
    nixosConfigurations.corentin = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager = { 
            useGlobalPkgs = true;
            useUserPackages = true;
            backupFileExtension = "backup";
            users.corentin = import ./home.nix;
          };
        }
      ];
    };

    homeConfigurations.corentin = home-manager.lib.homeManagerConfiguration {
      inherit pkgs; 
      modules = [ ./home.nix ];
    };
  };
}

