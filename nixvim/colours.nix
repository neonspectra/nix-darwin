{
  programs.nixvim.colorschemes.base16.enable = true;
  programs.nixvim.colorschemes.base16.colorscheme = {
      base00 = "#050014";  # Background
      base01 = "#230046";  # Black (Darker Background)
      base02 = "#372d46";  # Bright Black (Comments, Line Numbers)
      base03 = "#736e7d";  # Bright White (Light Gray, Secondary Text)
      base04 = "#8c91fa";  # Foreground (Selection Foreground, Alternate Text)
      base05 = "#736e7d";  # Default Foreground
      base06 = "#8c91fa";  # Cursor Color, Bright White
      base07 = "#8c91fa";  # Brightest White (Unused, but mapped)
      base08 = "#7d1625";  # Red (Error, Warnings)
      base09 = "#e05167";  # Bright Red (More Intense Errors)
      base0A = "#7f6f49";  # Yellow (Identifiers, Constants)
      base0B = "#337e6f";  # Green (Strings, Success)
      base0C = "#58777f";  # Cyan (Hints, Classes, Special Functions)
      base0D = "#4f4a7f";  # Blue (Functions, Keywords)
      base0E = "#5a3f7f";  # Magenta (Types, Special Elements)
      base0F = "#e0c386";  # Bright Yellow (Uncommon Syntax, Deprecated)
  };
}
