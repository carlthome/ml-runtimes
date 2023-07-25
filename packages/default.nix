{ pkgs ? import <nixpkgs> { } }: rec {
  beam = pkgs.callPackage ./beam { };
  jax = pkgs.callPackage ./jax { };
  pytorch = pkgs.callPackage ./pytorch { };
  sklearn = pkgs.callPackage ./sklearn { };
  tensorflow = pkgs.callPackage ./tensorflow { };
  all = pkgs.symlinkJoin {
    name = "all";
    paths = [
      beam
      jax
      pytorch
      sklearn
      tensorflow
    ];
    meta = {
      description = "Python environments for machine learning development";
    };
  };
  default = all;
}
