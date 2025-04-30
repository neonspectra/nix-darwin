{ pkgs, ... }: {
  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";
    taps = [];
    brews = [ "cowsay" "rsync" "gnupg" "pinentry-mac" "grep" "koekeishiya/formulae/yabai" "koekeishiya/formulae/skhd" ];
    casks = [ "kitty" "mpv" "gimp" ];
  };

  users.users."neon".shell = pkgs.bashInteractive;
  networking.hostName = "paradiso";
}
