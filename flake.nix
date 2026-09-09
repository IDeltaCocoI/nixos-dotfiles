{
  description = "Delta_Coco's Nixos configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim/nixos-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nixvim, ... }@inputs:
    let
    system = "x86_64-linux";
  pkgs = import nixpkgs { inherit system; };
  in
  {
    nixosConfigurations.corentin = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "backup";

              extraSpecialArgs = { inherit inputs nixvim; };

              users.corentin = {
                imports = [
                  ./home.nix
                    nixvim.homeManagerModules.nixvim
                ];
              };
            };
          }
      ];
    };

    homeConfigurations.epita = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = { inherit inputs nixvim; };
      modules = [ 
        ./epita.nix 
        nixvim.homeManagerModules.nixvim
      ];
    };
  };
}
