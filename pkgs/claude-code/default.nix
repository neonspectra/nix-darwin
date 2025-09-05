{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation rec {
  pname = "claude-code";
  version = "1.0.107";

  src = pkgs.fetchurl {
    url = "https://registry.npmjs.org/@anthropic-ai/claude-code/-/claude-code-1.0.107.tgz";
    sha256 = "sha256-18f5633f3h9188q22bwkwirl5pvwi4xga92ng371z63mrpk8cbpg"; # populated by doing nix-prefetch-url on the above package url. we love security dont we folks.
  };

  nativeBuildInputs = [ pkgs.nodejs ];

  installPhase = ''
    mkdir -p $out/lib/node_modules
    npm install -g --prefix=$out $src
    ln -s $out/lib/node_modules/@anthropic-ai/claude-code/bin/claude-code.js $out/bin/claude-code
    chmod +x $out/bin/claude-code
  '';
}

