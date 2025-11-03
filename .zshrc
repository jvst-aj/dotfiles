# Starship
eval "$(starship init zsh)"

# Nvim
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Shell history size
HISTSIZE=1000
HISTFILESIZE=1000

# Set default editor
export EDITOR="nvim"
export VISUAL="$EDITOR"

# Clipboard alias
alias clip='xclip -selection clipboard'

# List aliases
alias ll='ls -l'
alias la='ls -la'

# Dir aliases
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

# Set find aliases
alias fd=fdfind

# TUI aliases
alias lg=lazygit
alias ld=lazydocker

# Git aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gcm='git commit -m'
alias gd='git diff'
alias gdc='git diff --cached'
alias gp='git push'

# Nvim aliases
alias setupvim='gh repo clone JosaelPerez/config && rm -rf ~/.config/nvim && cp -r ./config/nvim ~/.config/nvim && rm -rf ./config'

# Python aliases
alias pip='python -m pip'
alias poetry='python -m poetry'

# Poetry config
export POETRY_VIRTUALENVS_IN_PROJECT=true

# Python path
export PATH="$HOME/.local/bin:$PATH"

# Yazi shell wrapper that provides the ability to change the current working directory when exiting Yazi
# Use y instead of yazi to start, and press q to quit, you'll see the CWD changed.
# Sometimes, you don't want to change, press Q to quit.
# See more: https://yazi-rs.github.io/docs/quick-start
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# nvm 
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
# bun completions
[ -s "/home/josaelprz/.bun/_bun" ] && source "/home/josaelprz/.bun/_bun"

# AWS CLI Completions
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit
complete -C '/usr/local/bin/aws_completer' aws
