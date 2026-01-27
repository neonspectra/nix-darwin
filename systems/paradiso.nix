{ pkgs, ... }: {

  environment.systemPackages = [
    pkgs.vim
    pkgs.tmux
    pkgs.rclone
    pkgs.p7zip
    pkgs.ncdu
    pkgs.nodejs
    pkgs.findutils
    pkgs.git-lfs
    pkgs.asdf
  ]; 

  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";
    taps = [ "koekeishiya/formulae" ]; # koekeishiya tap needed for yabai and skhd
    brews = [ "cowsay" "rsync" "gnupg" "pinentry-mac" "grep" "yabai" "skhd" "ansible" ];
    casks = [ "kitty" "mpv" "gimp" "keepassxc" "1password-cli" ];
  };

  system.primaryUser = "neon";
  users.users."neon".shell = pkgs.bashInteractive;
  networking.hostName = "paradiso";
}
