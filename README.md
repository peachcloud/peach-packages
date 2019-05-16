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

# TODO create an actual dev@peachcloud.org key
gpg --full-generate-key
# type: RSA + DSA
# size: 4096
# valid: always
# name: PeachCloud Developers
# email: dev@peachcloud.org
# passphrase: 1234567890
```
