{
  description = "home manager config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim.url = "github:nix-community/nixvim";
  };

  outputs = { nixpkgs, nixpkgs-unstable, home-manager, nixvim, ... }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
    pkgs-unstable = import nixpkgs-unstable {
      inherit system;
      config.allowUnfree = true;
    };
  in {
    homeConfigurations = {
      forkd = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        extraSpecialArgs = {
          inherit pkgs-unstable;
        };

        modules = [
          ./home.nix

        nixvim.homeManagerModules.nixvim
      ];
    };
  };
};
}
    
