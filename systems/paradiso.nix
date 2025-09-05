{ pkgs, ... }: {

  environment.systemPackages = [
    pkgs.vim
    pkgs.tmux
    pkgs.rclone
    pkgs.p7zip
    pkgs.ncdu
    pkgs.claude-code
  ]; 

  # Override needed for nonfree packages specifically so we can install claude-code above.
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (pkgs.lib.getName pkg) [ "claude-code" ];

  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";
    taps = [ "koekeishiya/formulae" ]; # koekeishiya tap needed for yabai and skhd
    brews = [ "cowsay" "rsync" "gnupg" "pinentry-mac" "grep" "yabai" "skhd" ];
    casks = [ "kitty" "mpv" "gimp" "keepassxc" ];
  };

  system.primaryUser = "neon";
  users.users."neon".shell = pkgs.bashInteractive;
  networking.hostName = "paradiso";
}
