#!/bin/bash

# saner programming env: these switches turn some bugs into errors
set -o errexit -o pipefail -o noclobber -o nounset

function install_debrep {
  LATEST=$(git ls-remote https://github.com/pop-os/debrepbuild | grep HEAD | cut -c-7)

  INSTALL=
  if type debrep; then
      CURRENT=$(debrep --version | cut -d' ' -f5 | cut -c2- | cut -c-7)
    if [ ! $CURRENT ] || [ $CURRENT != $LATEST ]; then
      INSTALL=1
    fi
  else
    INSTALL=1
  fi

  if [ $INSTALL ]; then
    cargo install --git https://github.com/pop-os/debrepbuild --force
  fi
}

function update_submodules {
  git submodule update --init --recursive --remote
}

#install_debrep
update_submodules
debrep build
