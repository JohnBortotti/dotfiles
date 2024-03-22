{
  description = "john bortotti home-manager configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = { 
      url = "github:nix-community/home-manager/master"; 
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }: 
      let
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        homeConfigurations = {
          "joao" = home-manager.lib.homeManagerConfiguration {
	    inherit pkgs;

	    modules = [
	      ./layers/home.nix
	      #./layers/dev.nix
	    ];

          };
        };
      };
}

