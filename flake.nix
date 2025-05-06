{
  description = "LaTeX development environment with VS Code";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
  };

  outputs =
    { self, nixpkgs }:
    {
      devShellFor =
        system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
        pkgs.mkShell {
          buildInputs = with pkgs; [
            tectonic # compiler
            ltex-ls # Grammar/spelling checker for LaTeX
            aspell
            aspellDicts.en
            #   (pkgs.vscode-extensions.james-yu.latex-workshop)
          ];
        };
    };
}
