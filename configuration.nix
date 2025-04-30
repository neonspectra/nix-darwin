{ pkgs, ... }: {

  # Standard nix configuration stuff
  nix.settings.experimental-features = "nix-command flakes";
  system.configurationRevision = null; # Will be set from flake
  system.stateVersion = 5;
  nix.enable = false; # We are using determinate nix, so we want this false
  nixpkgs.hostPlatform = "aarch64-darwin";

  # Use nvim configuration from nixvim module
  imports = [ ./nixvim ];
  programs.nixvim.enable = true;

  # Menubar Settings
  system.defaults.menuExtraClock.Show24Hour = true;
  system.defaults.controlcenter.BatteryShowPercentage = true;

  # Dock Settings
  # Nix version of this command: defaults write com.apple.dock autohide-delay -float 0; killall Dock
  #system.defaults.dock.autohide-delay = 0;

  # Finder Settings
  system.defaults.finder = {
    ShowPathbar = true;
    ShowStatusBar = true;
    ## Show folders before other files when sorting by name
    _FXSortFoldersFirst = true;
    ## Hide desktop icons
    CreateDesktop = false;
    ## Set default search scope to current folder
    FXDefaultSearchScope = "SCcf";
    ## Remove trash after 30 days
    FXRemoveOldTrashItems = true;
    ## Set Finder to column view default
    FXPreferredViewStyle = "clmv";
  };
  
  # Other misc preferences
  system.defaults.CustomUserPreferences = {
    # # Screenshots to /tmp
    "com.apple.screencapture" = {
      location = "/private/tmp";
      type = "png";
    };
    # Disable pinentry save to keychain
    "org.gpgtools.common" = {
      "UseKeychain" = "NO";
    };
  };
}
