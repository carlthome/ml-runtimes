{ pkgs ? import <nixpkgs> { }, ... }:
pkgs.buildEnv {
  name = "ipython";
  paths = [
    (pkgs.python3.withPackages (ps: with ps; [
      ipython
      matplotlib
      tensorflow
      # TODO Broken on darwin.
      #tensorflow-datasets
    ]))
  ];
  meta = {
    description = "Python environment for TensorFlow development";
  };
}
