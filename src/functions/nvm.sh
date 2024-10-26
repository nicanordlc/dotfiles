#!/bin/bash
# shellcheck disable=1090

nvmInstall(){
  mkdir -p ~/.nvm

  # Source `nvm`
  [ -s "$(brew --prefix nvm)/nvm.sh" ] && \. "$(brew --prefix nvm)/nvm.sh"

  nvm install --lts
}

# If this file is running in terminal call the function `nvmInstall`
# Otherwise just source it
if [ "$(basename "${0}")" = "nvm.sh" ]
then
  nvmInstall "${@}"
fi

