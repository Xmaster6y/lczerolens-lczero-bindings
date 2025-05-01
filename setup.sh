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

echo "LC0_VERSION: $LC0_VERSION"

cd lc0
git checkout "$LC0_VERSION"
cp ../lc0-pyproject.toml pyproject.toml
# Remove the 'v' prefix for the version in pyproject.toml
VERSION_WITHOUT_V="${LC0_VERSION#v}"
# For macOS (BSD sed)
if [[ "$OSTYPE" == "darwin"* ]]; then
    sed -i '' -e "s/<version>/$VERSION_WITHOUT_V/" pyproject.toml
else
    sed -i -e "s/<version>/$VERSION_WITHOUT_V/" pyproject.toml
fi

echo "pyproject.toml: $(cat pyproject.toml)"

git config user.name 'Xmaster6y'
git config user.email '66315201+Xmaster6y@users.noreply.github.com'
git commit -am "setup.sh: update version to $LC0_VERSION"
