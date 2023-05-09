let
  default = import ./.;
  override = attrs: default.overrideAttrs (old: attrs);
  pkgs = import ./pkgs.nix;
in
{
  inherit default;
  update = override {
    buildInputs = [ pkgs.ruby ];
    shellHook = ''
      bundler package --no-install --path vendor
      rm -rf .bundle* vendor
      exec bundix
    '';
  };
  build = override {
    shellHook = ''
      exec jekyll build --incremental
    '';
  };
  rebuild = override {
    shellHook = ''
      exec jekyll build
    '';
  };
  serve = override {
    shellHook = ''
      exec jekyll serve --watch --incremental
    '';
  };
}
