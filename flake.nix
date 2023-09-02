{
  description = "Nix packages with ML runtime dependencies for interactive development";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-github-actions = {
      url = "github:nix-community/nix-github-actions";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nix-github-actions }:
    let
      forEachSystem = nixpkgs.lib.genAttrs [ "x86_64-linux" "aarch64-darwin" ];
      forEachPkgs = f: forEachSystem (sys: f nixpkgs.legacyPackages.${sys});
    in
    {
      githubActions = nix-github-actions.lib.mkGithubMatrix { checks = self.packages; };
      packages = forEachPkgs (pkgs: import ./packages { inherit pkgs; });
      devShells = forEachPkgs (pkgs: import ./shell.nix { inherit pkgs; });
      formatter = forEachPkgs (pkgs: pkgs.nixpkgs-fmt);
    };
}
