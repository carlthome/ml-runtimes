{ pkgs ? import <nixpkgs> { } }: {
  jax = pkgs.callPackage ./jax { };
  pytorch = pkgs.callPackage ./pytorch { };
  sklearn = pkgs.callPackage ./sklearn { };
  tensorflow = pkgs.callPackage ./tensorflow { };
}
