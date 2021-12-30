# pman0214/alpine-redpen

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

> redpen execution environment on alpine

## Table of Contents

- [pman0214/alpine-redpen](#pman0214alpine-redpen)
  - [Table of Contents](#table-of-contents)
  - [Install](#install)
  - [Usage](#usage)
  - [Building](#building)
  - [Contribute](#contribute)
  - [License](#license)

## Install

```bash
docker pull pman0214/alpine-redpen
```

## Usage

Default `WORKDIR` is `/app`.

```bash
docker run --rm -it -v $PWD:/app pman0214/alpine-redpen redpen main.tex
docker run --rm -it -v $PWD:/app pman0214/alpine-redpen redpen -c redpen-conf.xml *.tex > redpen_results.txt
```

## Building

If you want to build this image by yourself, please prepare for a multi-architecture builder referring to the [official documents](https://docs.docker.com/desktop/multi-arch/).
```bash
docker run --privileged --rm tonistiigi/binfmt --uninstall "qemu-*"
docker run --privileged --rm tonistiigi/binfmt --install all
docker buildx create --name multiarch --driver docker-container
docker buildx use multiarch
docker buildx inspect --bootstrap
```
In this example, `multiarch` is the name of the multi-architecture builder.

You can build this image with your own multi-architecture builder.
```bash
docker buildx build \
  --platform linux/amd64,linux/arm64 \
  -t "alpine-redpen" \
  . --load
```
`--push` option instead of `--load` with appropriate tag pushes built images to GitHub.

## Contribute

* Bugfix pull requests are welcome.

## License

All the source files are released under the MIT license. See `LICENSE.txt`.

* Copyright (c) 2021 Shigemi ISHIDA
