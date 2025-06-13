{
  programs.nixvim.plugins = {
    image = {
      enable = true;
      settings.backend = "kitty";
      settings.integrations.markdown.enabled = true;
      };
  };
}
