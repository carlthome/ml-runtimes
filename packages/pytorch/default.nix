{ pkgs ? import <nixpkgs> { }, ... }:
pkgs.buildEnv {
  name = "ipython";
  paths = [
    (pkgs.python3.withPackages (ps: with ps; [
      ipython
      matplotlib
      torch
      torchaudio
      torchvision
      seaborn
      transformers
      datasets
      torchmetrics
      soundfile
    ]))
  ];
  meta = {
    description = "Python environment for PyTorch development";
  };
}
