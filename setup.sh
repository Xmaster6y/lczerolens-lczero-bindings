#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Error: Version argument is required"
    echo "Usage: $0 <version>"
    echo "Example: $0 v0.31.2"
    exit 1
fi

if [[ ! $1 =~ ^v ]]; then
    echo "Error: Version must start with 'v'"
    echo "Example: $0 v0.31.2"
    exit 1
fi

cd lc0
git checkout "$1"
cp ../pyproject.toml .
# Remove the 'v' prefix for the version in pyproject.toml
VERSION_WITHOUT_V="${1#v}"
# For Linux (GNU sed)
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    sed -i "s/<version>/$VERSION_WITHOUT_V/" pyproject.toml
# For macOS (BSD sed)
elif [[ "$OSTYPE" == "darwin"* ]]; then
    sed -i '' "s/<version>/$VERSION_WITHOUT_V/" pyproject.toml
fi
git commit -am "setup.sh: update version to $1" -c user.name='Xmaster6y' -c user.email='66315201+Xmaster6y@users.noreply.github.com'
