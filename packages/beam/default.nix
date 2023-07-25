{ pkgs ? import <nixpkgs> { }, ... }:
pkgs.buildEnv {
  name = "ipython";
  paths = [
    (pkgs.python3.withPackages (ps: with ps; [
      ipython
      matplotlib
      apache-beam
    ]))
  ];
  meta = {
    description = "Python environment for Apache Beam development";
  };
}
