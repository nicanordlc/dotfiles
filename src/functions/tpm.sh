#!/bin/bash

tpmInstall(){
  local TMUX_PATH="${HOME}/.tmux/plugins/tpm"

  if [ ! -f "${TMUX_PATH}" ]
  then
    git clone https://github.com/tmux-plugins/tpm "${TMUX_PATH}"
  fi

  # Install TMUX plugins :: Taken from ->
  # (https://github.com/tmux-plugins/tpm/issues/6#issuecomment-54520698)

  # start a server but don't attach to it
  tmux start-server

  # create a new session in the background
  tmux new-session -d

  # install the plugins
  ~/.tmux/plugins/tpm/scripts/install_plugins.sh

  # install is done, turn off tmux for later
  tmux kill-server
}

# If this file is running in terminal call the function `tpmInstall`
# Otherwise just source it
if [ "$(basename "${0}")" = "tpm.sh" ]
then
  tpmInstall "${@}"
fi
