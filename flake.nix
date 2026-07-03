{
  description = "Jekyll development environment for inze.ph";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        ruby = pkgs.ruby_3_3;
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = [
            ruby
            pkgs.pkg-config
            pkgs.libxml2
            pkgs.libxslt
            pkgs.libyaml
            pkgs.zlib
            pkgs.openssl
          ];

          shellHook = ''
            export GEM_HOME="$PWD/.gems"
            export PATH="$GEM_HOME/bin:$PATH"
            export NOKOGIRI_USE_SYSTEM_LIBRARIES=1
          '';
        };
      });
}
