{
  description = "masihkasar Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-23.11-darwin";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  #outputs = inputs@{ nixpkgs, home-manager, ... }: 
  outputs = inputs@{ self, nix-darwin, nixpkgs }:

  let
    system = "aarch64-darwin";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    darwinConfigurations."masihkasar-MacBook" = nix-darwin.lib.darwinSystem {
      modules = [ ./configuration.nix ];
    };

    #homeConfigurations = {
    #  laxa = home-manager.lib.homeManagerConfiguration {
    #    inherit pkgs;
    #    modules = [
    #      ./home/home.nix
    #    ];
    #  };
    #};
  };
}

