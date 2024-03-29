{ pkgs ? import <nixpkgs> { }, ... }:
pkgs.buildEnv {
  name = "ipython";
  paths = [
    (pkgs.python3.withPackages (ps: with ps; [
      ipython
      matplotlib
      jax
      jaxlib-bin
      # TODO Broken on darwin.
      #flax
      #optax
    ]))
  ];
  meta = {
    description = "Python environment for JAX development";
  };
}
