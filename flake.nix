{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-24.11-darwin";
    nix-darwin.url = "github:LnL7/nix-darwin/nix-darwin-24.11";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    nixvim.url = "github:nix-community/nixvim/nixos-24.11"; # Match nixpkgs version
    nixvim.inputs.nixpkgs.follows = "nixpkgs"; # Ensure compatibility
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nixvim }:
  let
    configuration = import ./configuration.nix;
    paradiso = import ./systems/paradiso.nix;
    gehenna = import ./systems/gehenna.nix;
  in
  {
    darwinConfigurations."paradiso" = nix-darwin.lib.darwinSystem {
      modules = [
        configuration
        paradiso
        nixvim.nixDarwinModules.nixvim # Import NixVim module
      ];
    };
    darwinConfigurations."synnax" = nix-darwin.lib.darwinSystem {
      modules = [
        configuration
        gehenna
        nixvim.nixDarwinModules.nixvim # Import NixVim module
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
