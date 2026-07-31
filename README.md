# Versioned `lczero-bindings`

[![v-lczero-bindings](https://img.shields.io/pypi/v/v-lczero-bindings?color=purple)](https://pypi.org/project/v-lczero-bindings/)
[![python versions](https://img.shields.io/pypi/pyversions/v-lczero-bindings.svg)](https://www.python.org/downloads/)
![publish](https://github.com/Xmaster6y/v-lczero-bindings/actions/workflows/publish.yml/badge.svg)

PyPI distribution of the Python bindings from
[Leela Chess Zero](https://github.com/LeelaChessZero/lc0).

## Supported Python and platforms

Wheels are built for CPython 3.10 through 3.14 on:

- Linux x86_64 and ARM64;
- macOS x86_64 and ARM64.

Install the bindings with:

```bash
pip install v-lczero-bindings
```

The package version matches the lc0 release used to build it.

## Releases

The repository checks daily for a new stable lc0 release. When one is found, an
automated pull request updates the lc0 submodule. Merging that pull request
builds and smoke-tests every wheel before publishing the matching version to
PyPI.

A release can also be started manually from the **Publish** workflow. The
requested version must match the exact lc0 tag checked out by the submodule.

## Remark

Feel free to open an issue if you encounter a build problem or need another
platform.
