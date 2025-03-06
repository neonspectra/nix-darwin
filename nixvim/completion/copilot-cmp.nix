{ lib, config, ... }:
{
  programs.nixvim.plugins.copilot-cmp = lib.mkIf config.plugins.cmp.enable {
    enable = true;
  };
  programs.nixvim.plugins.copilot-lua = {
    enable = true;
    settings = {
      suggestion = {
        enabled = false;
      };
      panel = {
        enabled = false;
      };
    };
  };

  programs.nixvim.extraConfigLua = lib.mkIf config.plugins.cmp.enable ''
    require("copilot").setup({
      suggestion = { enabled = false },
      panel = { enabled = false },
    })
  '';
}
