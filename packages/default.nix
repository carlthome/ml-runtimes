{ pkgs ? import <nixpkgs> { } }: rec {
  jax = pkgs.callPackage ./jax { };
  pytorch = pkgs.callPackage ./pytorch { };
  sklearn = pkgs.callPackage ./sklearn { };
  tensorflow = pkgs.callPackage ./tensorflow { };
  all = pkgs.symlinkJoin {
    name = "all";
    paths = [
      jax
      pytorch
      sklearn
      tensorflow
    ];
  };
  default = all;
}
