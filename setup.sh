#!/usr/bin/env bash

set -euo pipefail

if [[ -z "${LC0_VERSION:-}" ]]; then
    echo "Error: LC0_VERSION environment variable is required"
    echo "Usage: LC0_VERSION=<version> $0"
    echo "Example: LC0_VERSION=v0.31.2 $0"
    exit 1
fi

if [[ ! $LC0_VERSION =~ ^v ]]; then
    echo "Error: LC0_VERSION must start with 'v'"
    echo "Example: LC0_VERSION=v0.31.2 $0"
    exit 1
fi

echo "LC0_VERSION: $LC0_VERSION"

git -C lc0 checkout --detach "$LC0_VERSION"
git -C lc0 submodule update --init --recursive
cp lc0-pyproject.toml lc0/pyproject.toml

# Remove the 'v' prefix for the version in pyproject.toml
VERSION_WITHOUT_V="${LC0_VERSION#v}"
# For macOS (BSD sed)
if [[ "$OSTYPE" == "darwin"* ]]; then
    sed -i '' -e "s/<version>/$VERSION_WITHOUT_V/" lc0/pyproject.toml
else
    sed -i -e "s/<version>/$VERSION_WITHOUT_V/" lc0/pyproject.toml
fi

echo "Prepared v-lczero-bindings $VERSION_WITHOUT_V from lc0 $LC0_VERSION"
