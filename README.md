# ml-runtimes

Nix packages for interactive ML development

## Usage

First, install `nix` ([installation](https://nixos.org/download.html)) with [flakes enabled](https://nixos.wiki/wiki/Flakes#Enable_flakes).

```sh
# List all environments.
nix flake show github:carlthome/ml-runtimes

# Start ipython within a specific environment.
nix run github:carlthome/ml-runtimes#pytorch

# Give ipython additional command-line arguments.
nix run github:carlthome/ml-runtimes#pytorch -- --debug -c "import torch; print(torch.__version__)"
```

## Develop

```sh
# Clone repo into working directory.
nix flake clone github:carlthome/ml-runtimes --dest .

# Install development dependencies (or use direnv).
nix develop

# Open your text editor for a package by name.
nix edit .#pytorch

# Update input flakes.
nix flake update --commit-lock-file

# Test that flake definition changes will work.
nix flake check

# Build all packages.
nix build
```

## FAQ

### Why does this repo exist?

Primarily, this is a testing ground for understanding when the nixpkgs versions of all big deep learning libraries are ready to be used in industry. This repo is not intended to include workarounds, as those should preferably be upstreamed. The goal is to know that `nix run` can work on both x86_64-linux and aarch64-darwin, with reasonable GPU support and everything working as expected by a ML engineer.
