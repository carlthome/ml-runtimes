{ pkgs ? import <nixpkgs> { }, ... }: {
  default = pkgs.mkShell {
    packages = with pkgs; [
      act
      cachix
      git
      nix-diff
      nix-info
      nixpkgs-fmt
    ];
    meta = {
      description = "Development shell for ML runtimes flake";
    };
  };
}
