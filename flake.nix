{
  description = "";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # TODO: reorganise
  # rousette.org.uk/archives/setting-up-a-development-environment-with-nix-and-home-manager/
  outputs = { nixpkgs, home-manager, ... }:
    let
      username = "minghongxu";
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          {
            home = {
              inherit username;
              homeDirectory = "/home/${username}";
              stateVersion = "23.11";
            };
            programs.home-manager.enable = true;
          }
            ./home.nix
        ];
      };
    };
}
