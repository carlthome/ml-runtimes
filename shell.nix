{ pkgs ? import <nixpkgs> { }, ... }:
{
  default = pkgs.mkShell
    {
      packages = with pkgs; [
        act
        cachix
        git
        home-manager
        nix-diff
        nix-info
        nixpkgs-fmt
        vscodium
      ];
    };
}
