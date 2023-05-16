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
      huggingface-hub
      transformers
      datasets
      soundfile
    ]))
  ];
  meta = {
    description = "Python environment for PyTorch development";
  };
}
