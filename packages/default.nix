{ pkgs ? import <nixpkgs> { } }:
let
  environments = {
    beam = pkgs.callPackage ./beam { };
    jax = pkgs.callPackage ./jax { };
    pytorch = pkgs.callPackage ./pytorch { };
    sklearn = pkgs.callPackage ./sklearn { };
    tensorflow = pkgs.callPackage ./tensorflow { };
  };
  all = packages: pkgs.symlinkJoin { name = "all"; paths = builtins.attrValues packages; };
in
environments // { default = all environments; }
