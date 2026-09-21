{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = inputs@{ nixpkgs, ... }: inputs.flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs {
        inherit system;
      };
      tools = with pkgs; [
        kubectl # Kubernetes CLI
        kubernetes-helm # Package manager for kubernetes
      ];
      help-text = /* sh */ ''
        echo "Available Commands:"
        echo "  x                     descriptions"
        echo
      '';
      scripts = with pkgs; [
        (writeShellScriptBin "?" help-text)
        (writeShellScriptBin "help" help-text)
      ];
    in
    {
      devShells = {
        default = pkgs.mkShell {
          buildInputs = with pkgs; [ ];
          nativeBuildInputs = with pkgs; [ ];
          packages = with pkgs; [ ]
            ++ tools
            ++ scripts;
        };
      };
    }
  );
}
