{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-25.05-darwin";
    nix-darwin.url = "github:LnL7/nix-darwin/nix-darwin-25.05";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    nixvim.url = "github:nix-community/nixvim/nixos-25.05"; # Match nixpkgs version
    nixvim.inputs.nixpkgs.follows = "nixpkgs"; # Ensure compatibility
  };

  outputs = inputs@{ self, nixpkgs, nix-darwin, nixvim }:
  let
    system = "aarch64-darwin";
    pkgs = import nixpkgs { inherit system; };

    # Import system and configuration modules
    configuration = import ./configuration.nix;
    paradiso = import ./systems/paradiso.nix;
    gehenna = import ./systems/gehenna.nix;

    # Custom packages (e.g. claude-code)
    customPackages = import ./pkgs { inherit pkgs; };
  in
  {
    # Export custom packages from flake (optional)
    packages.${system} = customPackages;

    darwinConfigurations."paradiso" = nix-darwin.lib.darwinSystem {
      modules = [
        configuration
        paradiso
        nixvim.nixDarwinModules.nixvim # Import NixVim module
        ./modules/claude-code.nix      # Custom module for claude-code
        {
          programs.claude-code.enable = true; # Enable claude-code system-wide
        }
      ];
    };

    darwinConfigurations."gehenna" = nix-darwin.lib.darwinSystem {
      modules = [
        configuration
        gehenna
        nixvim.nixDarwinModules.nixvim # Import NixVim module
      ];
    };
  };
}

