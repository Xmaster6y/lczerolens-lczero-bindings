#!/bin/bash

if [ -z "$LC0_VERSION" ]; then
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

cd lc0
git checkout "$LC0_VERSION"
cp ../pyproject.toml .
# Remove the 'v' prefix for the version in pyproject.toml
VERSION_WITHOUT_V="${LC0_VERSION#v}"
# For Linux (GNU sed)
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    sed -i "s/<version>/$VERSION_WITHOUT_V/" pyproject.toml
# For macOS (BSD sed)
elif [[ "$OSTYPE" == "darwin"* ]]; then
    sed -i '' "s/<version>/$VERSION_WITHOUT_V/" pyproject.toml
fi
git commit -am "setup.sh: update version to $LC0_VERSION" --author='Xmaster6y <66315201+Xmaster6y@users.noreply.github.com>'
