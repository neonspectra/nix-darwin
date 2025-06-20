{ pkgs, ... }: {

  environment.systemPackages = [
    pkgs.vim
    pkgs.tmux
    pkgs.rclone
    pkgs.p7zip
    pkgs.ncdu
  ];

  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";
    taps = [ "koekeishiya/formulae" ]; # koekeishiya tap needed for yabai and skhd
    brews = [ "cowsay" "rsync" "gnupg" "pinentry-mac" "grep" "yabai" "skhd" "ollama" "terraform" ];
    casks = [ "kitty" "mpv" "gimp" "keepassxc" "element" "karabiner-elements" "macfuse" "chromium" "orbstack" "soduto" ];
  };

  system.primaryUser = "xue";
  users.users."xue".shell = pkgs.bashInteractive;
  networking.hostName = "gehenna";
}
