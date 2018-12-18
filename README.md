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
npm install
```

to build for all architectures (amd64, armhf, and arm64):

```shell
npm run build
```

will build into `./output` directory.

to build for a specific architecture:

```shell
npm run build:amd64
```

```shell
npm run build:armhf
```

```shell
npm run build:arm64
```
