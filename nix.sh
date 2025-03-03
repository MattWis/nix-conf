#!/usr/bin/env bash

pushd `dirname $0`

nvim configuration.nix

# Copy local config to global config and rebuild
sudo cp `hostname`/*.nix /etc/nixos
sudo cp configuration.nix /etc/nixos
sudo nixos-rebuild switch --cores 4 --upgrade || exit 1

# Get current generation metadata
current=$(nixos-rebuild list-generations | grep current)

# Commit all changes witih the generation metadata
git commit -am "`hostname`: $current"

popd
