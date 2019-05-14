# peach-packages

Debian packages for PeachCloud

## packages

- `peach-base`:
  - setup `peach` user & group
  - setup `/etc/peach` config directory
  - setup `/var/lib/peach` state directory

## how to build

```shell
git clone git@github.com:peachcloud/peach-packages
cd peach-packages

sudo apt install sbuild
sudo sbuild-adduser dinosaur
cp /usr/share/doc/sbuild/examples/example.sbuildrc ~/.sbuildrc
newgrp sbuild
```

TODO

to build for all architectures (amd64, armhf, and arm64):

```shell
./build.sh
```

will build into `./output` directory.

to build for a specific architecture:

```shell
./build.sh --arch amd64
```

to build for a specific package

```
./build.sh --package peach-upnp
```
