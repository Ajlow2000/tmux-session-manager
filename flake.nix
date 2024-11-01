{
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    };

    outputs = { self, nixpkgs }:
    let
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
    in
    {
        packages.${system}.default = 
            pkgs.writeShellApplication {
                name = "tmux-session-manager";
                runtimeInputs = [];
                text = builtins.readFile ./tmux-session-manager.sh;
            };


        devShell.x86_64-linux =
            pkgs.mkShell {
                buildInputs = with pkgs;[
                    nil
                    bash-language-server
                ];
            };
    };
}