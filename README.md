# peach-packages

Debian packages for PeachCloud

## how to build

```shell
git clone git@github.com:peachcloud/peach-packages
cd peach-packages

cargo install --git git://github.com/ahdinosaur/debrepbuild

sudo apt install sbuild
sudo sbuild-adduser dinosaur
cp /usr/share/doc/sbuild/examples/example.sbuildrc ~/.sbuildrc
newgrp sbuild
sudo sbuild-createchroot --include=eatmydata,ccache,gnupg --make-sbuild-tarball=/srv/chroots/buster-sbuild.tgz buster /srv/chroots/buster http://deb.debian.org/debian
sudo sbuild-apt source:buster-amd64-sbuild apt-get install debhelper cargo
sudo sbuild-apt source:buster-amd64-sbuild apt-get install crossbuild-essential-i386:amd64 crossbuild-essential-arm64:amd64 crossbuild-essential-armhf:amd64
sudo schroot -c source:buster-amd64-sbuild -d / -- dpkg --add-architecture i386
sudo schroot -c source:buster-amd64-sbuild -d / -- dpkg --add-architecture arm64
sudo schroot -c source:buster-amd64-sbuild -d / -- dpkg --add-architecture armhf
sudo sbuild-apt source:buster-amd64-sbuild apt-get update
sudo sbuild-apt source:buster-amd64-sbuild apt-get install libstd-rust-dev:i386 libstd-rust-dev:arm64 libstd-rust-dev:armhf

# TODO create an actual dev@peachcloud.org key
gpg --full-generate-key
# type: RSA + DSA
# size: 4096
# valid: always
# name: PeachCloud Developers
# email: dev@peachcloud.org
# passphrase: 1234567890
```
