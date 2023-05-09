let
  pkgs = import ./pkgs.nix;
  env = pkgs.bundlerEnv rec {
    name = "jekyll-github-pages";
    ruby = pkgs.ruby;
    gemdir = ./.;
  };
in
pkgs.stdenv.mkDerivation {
  name = "ehs-support";
  src = ./.;
  buildPhase = ''jekyll build'';
  installPhase = ''mv _site $out'';
  buildInputs = with pkgs; [
    env
    ruby
  ];
  nativeBuildInputs = with pkgs; [
    bundler
    bundix
  ];
}
