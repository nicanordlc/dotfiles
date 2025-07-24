# ¯\_(ツ)_/¯
[[ $- != *i* ]] && return

# Script to source sources
. ~/.scripts/sourceifexists

# Mac related (¯\\_(ツ)_/¯)
case "$(uname -s)" in
    [Dd]arwin) sourceIfExists ~/.zsh/mac ;;
esac

# Import configurations
sourceIfExists \
    -imac \
    -ihooks \
    -icompletion \
    ~/.zsh/*
sourceIfExists \
    ~/.zsh/hooks \
    ~/.zsh/completion

# Package manager for `zsh`
sourceIfExists ~/.antigenrc

# Use VI mode in bash
setopt VI
setopt MENU_COMPLETE

# Autoexecute double bang history
unsetopt HIST_VERIFY

# Source FZF
. <(fzf --zsh)

# File Descriptor stuff
unsetopt MULTIOS

# google cloud platform
sourceIfExists /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc
sourceIfExists /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc

# bun
[ -s "~/.bun/_bun" ] && source "~/.bun/_bun" # bun completions
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# direnv
eval "$(direnv hook zsh)"

# nvm (macos)
export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix nvm)/nvm.sh" ] && \. "$(brew --prefix nvm)/nvm.sh"  # This loads nvm
[ -s "$(brew --prefix nvm)/etc/bash_completion.d/nvm" ] && \. "$(brew --prefix nvm)/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# zoxide
eval "$(zoxide init zsh)"
