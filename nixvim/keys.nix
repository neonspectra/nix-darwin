{
  programs.nixvim.keymaps = [
    # homerow typers stay mad
    {
      mode = "n";
      key = "a";
      action = "h";
    }
    {
      mode = "n";
      key = "s";
      action = "j";
    }
    {
      mode = "n";
      key = "w";
      action = "k";
    }
    {
      mode = "n";
      key = "d";
      action = "l";
    }
    {
      mode = "n";
      key = "v";
      action = "w";
    }
    {
      mode = "n";
      key = "y";
      action = "b";
    }
    {
      mode = "i";
      key = "qq";
      action = "<Esc>";
    }

    # (e)nsert
    {
      mode = "n";
      key = "e";
      action = "a";
    }
    {
      mode = "n";
      key = "E";
      action = "A";
    }

    # nano is love, nano is life
    {
      mode = [ "n" "v" ];
      key = "k";
      action = "d";
    }
    {
      mode = "n";
      key = "<C-v>";
      action = "<C-d>";
    }
    {
      mode = "n";
      key = "<C-y>";
      action = "<C-u>";
    }
    {
      mode = "n";
      key = "<C-a>";
      action = "0";
    }
    {
      mode = "n";
      key = "<C-e>";
      action = "$";
    }
    {
      mode = "n";
      key = "<BS>";
      action = "X";
    }

    # other
    {
      mode = "n";
      key = "h";
      action = "v";
    }
    {
      mode = [ "n" "v" ];
      key = "j";
      action = "y";
    }
    {
      mode = "n";
      key = "q";
      action = "<Nop>";
    }
    {
      mode = "n";
      key = "l";
      action = "q";
    }

    # insert single character without leaving normal mode
    {
      mode = "n";
      key = "<space>";
      action = ":lua vim.cmd('exe \"normal i\" .. nr2char(getchar())')<CR>";
    }

    # insert a newline without leaving normal mode
    {
      mode = "n";
      key = "<CR>";
      action = "o<Esc>";
    }

    # spelling
    {
      mode = "n";
      key = "<F3>";
      action = ":set spell!<CR>";
    }
    {
      mode = "n";
      key = "<F4>";
      action = "z=";
    }
    {
      mode = "n";
      key = "<F5>";
      action = "zg";
    }

    # Hop
    {
      mode = "n";
      key = "ff";
      action = ":HopWord<CR>";
    }
    {
      mode = "n";
      key = "fe";
      action = ":HopLineStart<CR>";
    }
    {
      mode = "n";
      key = "fv";
      action = ":HopVertical<CR>";
    }
    {
      mode = "n";
      key = "fg";
      action = ":HopChar1<CR>";
    }
    {
      mode = "n";
      key = "fgg";
      action = ":HopChar2<CR>";
    }
    {
      mode = "n";
      key = "f/";
      action = ":HopPattern<CR>";
    }
  ];
}
