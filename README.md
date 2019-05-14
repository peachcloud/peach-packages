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
sudo sbuild-createchroot --include=eatmydata,ccache,gnupg buster /srv/chroot/buster-amd64-sbuild http://deb.debian.org/debian

# TODO create an actual dev@peachcloud.org key
gpg --full-generate-key
# type: RSA + DSA
# size: 4096
# valid: always
# name: PeachCloud Developers
# email: dev@peachcloud.org
# passphrase: 1234567890
```

TODO below:

to build for all architectures (amd64, armhf, and arm64):

```shell
./build.sh
```

to build for a specific architecture:

```shell
./build.sh --arch amd64
```

to build for a specific package

```
./build.sh --package peach-upnp
```
