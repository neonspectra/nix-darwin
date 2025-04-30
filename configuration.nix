{ pkgs, ... }: {
  imports = [ ./nixvim ];

  environment.systemPackages = [
    pkgs.vim
    pkgs.tmux
  ];

  programs.nixvim.enable = true;

  nix.settings.experimental-features = "nix-command flakes";

  system.configurationRevision = null; # Will be set from flake
  system.stateVersion = 5;
  nix.enable = false;
  nixpkgs.hostPlatform = "aarch64-darwin";

  system.defaults.menuExtraClock.Show24Hour = true;
  system.defaults.controlcenter.BatteryShowPercentage = true;

  system.defaults.dock.autohide = true;
  system.defaults.dock.autohide-time-modifier = 0.15;

  system.defaults.finder = {
    ShowPathbar = true;
    ShowStatusBar = true;
    _FXSortFoldersFirst = true;
    CreateDesktop = false;
    FXDefaultSearchScope = "SCcf";
    FXRemoveOldTrashItems = true;
    FXPreferredViewStyle = "clmv";
  };

  system.defaults.CustomUserPreferences = {
    "com.apple.screencapture" = {
      location = "/private/tmp";
      type = "png";
    };
    "org.gpgtools.common" = {
      "UseKeychain" = "NO";
    };
  };
}
