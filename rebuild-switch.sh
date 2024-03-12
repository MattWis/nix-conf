#!/usr/bin/env bash

# Copy local config to global config and rebuild
sudo cp `dirname $0`/configuration.nix /etc/nixos
sudo nixos-rebuild switch || exit 1

# Get current generation metadata
current=$(nixos-rebuild list-generations | grep current)

# Commit all changes witih the generation metadata
git commit -am "$current"
