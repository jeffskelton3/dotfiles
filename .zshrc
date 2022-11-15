export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(
    git
    vi-mode
    history-substring-search
)

source $ZSH/oh-my-zsh.sh

# User configuration

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# export JAVA_HOME=TODO
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/bin:/bin:$PATH"
export PATH="/usr/sbin:/sbin:$PATH"
export PATH="/Library/Apple/usr/bin:$PATH"
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
export PATH="/Users/jeffskelton/.scripts/bin:$PATH"
export PATH="/bin:/Users/jeffskelton/.pyenv/shims:$PATH"
export PATH="/Users/jeffskelton/.rbenv/shims:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/Users/jeffskelton/.local/bin:$PATH"
export PATH="/Users/jeffskelton/.scripts/bin:$PATH"
export PATH="$ANDROID_HOME/platform-tools:$PATH"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# use vim keybindings in the shell. W00t!
set -o vi

autoload -U add-zsh-hook
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
fi

# Checks to see if a tmux session is running and fires one up if there is not
automatically-start-tmux() {
  if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
    # if we are in a JetBrains IDE embedded terminal, don't start tmux. Bad things happen.
    if [ "$TERMINAL_EMULATOR" != "JetBrains-JediTerm" ]; then
       exec tmux
       echo "start tmux"
    fi
  fi
}


complete -C '/usr/local/bin/aws_completer' aws

# place this after nvm initialization!
load-nvmrc() {
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
automatically-start-tmux

VISUAL='nvim'; 
export VISUAL 
EDITOR='nvim'; 
export EDITOR


# ==================ALIASES==================================

alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
alias vim='nvim'
alias vi='nvim'
alias profile="vim ~/.zshrc"
alias zfresh="source ~/.zshrc"
alias sudo='sudo '
alias vimconfig='vim ~/.config/nvim/init.vim'
alias ideaconfig='vim ~/.ideavimrc'
alias proj='cd ~/Projects'
alias hosts='vim /etc/hosts'
alias cp='cp -iv'
alias mv='mv -iv'
alias mkdir='mkdir -pv'
alias cat='bat'
alias ll='exa -la'
alias top="htop"
alias tmuxconfig='vim ~/.tmux.conf'
alias ws='~/.scripts/bin/webstorm'

eval "$(rbenv init - zsh)"
eval "$(pyenv init --path)"
eval "$(starship init zsh)"

