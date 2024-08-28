{
  description = "Flake for building different-name.dev";

  inputs = {
    anemone = {
      url = "github:Speyll/anemone";
      flake = false;
    };

    catppuccin-bat = {
      url = "github:catppuccin/bat";
      flake = false;
    };

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    systems.url = "github:nix-systems/default";
  };

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      systems = import inputs.systems;

      perSystem = {
        self',
        pkgs,
        ...
      }: let
        inherit (inputs) anemone catppuccin-bat;
        themeName = (builtins.fromTOML (builtins.readFile "${anemone}/theme.toml")).name;
        tmThemeName = "Catppuccin Mocha.tmTheme";
      in {
        packages = {
          different-name-blog = pkgs.stdenv.mkDerivation {
            pname = "different-name-blog";
            version = "2024-08-23";
            src = ./.;
            nativeBuildInputs = with pkgs; [zola];
            configurePhase = ''
              mkdir -p "themes/${themeName}"
              cp -r ${anemone}/. "themes/${themeName}"

              mkdir -p "highlight_themes"
              cp "${catppuccin-bat}/themes/${tmThemeName}" "highlight_themes"
            '';
            buildPhase = "zola build";
            installPhase = "cp -r public $out";
          };

          default = self'.packages.different-name-blog;
        };

        devShells.default = pkgs.mkShell {
          packages = with pkgs; [zola];
          shellHook = let
            themePath = "themes/${themeName}";
            tmThemePath = "highlight_themes/${tmThemeName}";
          in ''
            mkdir -p themes
            if [ -L "${themePath}" ]; then
              rm "${themePath}"
            fi
            ln -sn "${anemone}" "${themePath}"

            mkdir -p highlight_themes
            if [ -L "${tmThemePath}" ]; then
              rm "${tmThemePath}"
            fi
            ln -sn "${catppuccin-bat}/themes/${tmThemeName}" "${tmThemePath}"
          '';
        };
      };
    };
}
