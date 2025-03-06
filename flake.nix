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
    configuration = { pkgs, ... }: {
      imports = [ ./nixvim ];
      # Install system packages
      environment.systemPackages = [
        pkgs.vim
      ];

      # Enable NixVim
      programs.nixvim.enable = true;

      # Homebrew setup
      homebrew = {
        enable = true;
        onActivation.cleanup = "zap";
        taps = [];
        brews = [ "cowsay" "rsync" "gnupg" "pinentry-mac" ];
        casks = [ "kitty" "mpv" ];
      };

      # User shell
      users.users."neon".shell = pkgs.bashInteractive;

      # Enable flakes
      nix.settings.experimental-features = "nix-command flakes";

      # Darwin system settings
      system.configurationRevision = self.rev or self.dirtyRev or null;
      system.stateVersion = 5;
      nix.enable = false;
      nixpkgs.hostPlatform = "aarch64-darwin";
      
      networking.hostName = "paradiso";
      system.defaults.CustomUserPreferences = {
        # Remove dock auto hide delay
        # Nix version of this command: defaults write com.apple.dock autohide-time-modifier -float 0.15; killall Dock
        "com.apple.dock" = {
          "autohide-time-modifier" = 0.15;
        };
        # Screenshots to /tmp
        "com.apple.screencapture" = {
          location = "/private/tmp";
          type = "png";
        };
        # Disable pinentry save to keychain
        "org.gpgtools.common" = {
          "UseKeychain" = "NO";
        };
      };

    };
  in
  {
    darwinConfigurations."paradiso" = nix-darwin.lib.darwinSystem {
      modules = [
        configuration
        nixvim.nixDarwinModules.nixvim # Import NixVim module
      ];
    };
  };
}
