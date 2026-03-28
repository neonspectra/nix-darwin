{
  # Import all your configuration modules here
  imports = [ 
    ./keys.nix
    ./hop.nix
    ./opts.nix
    ./image.nix
    ./neo-tree.nix
    ./blink-cmp.nix
    ./completion/avante.nix                                                                               
    ./completion/blink.nix                                                                                
    ./completion/blink-compat.nix                                                                         
    ./completion/cmp.nix                                                                                  
    ./completion/copilot-cmp.nix                                                                          
    ./completion/schemastore.nix                                                                          
    ./completion/luasnip.nix 
  ];
}
