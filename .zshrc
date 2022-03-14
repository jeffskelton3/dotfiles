export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(
    git
    mvn
    vi-mode
    history-substring-search
    aws
)

source $ZSH/oh-my-zsh.sh

# User configuration
export PATH="/usr/local/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export SDKROOT=$(xcrun --show-sdk-path)
export VOLTA_HOME="$HOME/.volta"
export SCRIPTS_HOME="$HOME/.scripts"
export PATH="$VOLTA_HOME/bin:$PATH"
export PATH="$SCRIPTS_HOME/bin:$PATH"
export GOPATH=$HOME/go
export GOBIN=$HOME/go/bin
export JAVA_HOME='/opt/homebrew/Cellar/openjdk@11/11.0.12'
export PATH='/bin:/Users/jeffskelton/.pyenv/shims:/Users/jeffskelton/.rbenv/shims:/Users/jeffskelton/.scripts/bin:/Users/jeffskelton/.volta/bin:/opt/homebrew/bin:/usr/local/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/go/bin:/Library/Apple/usr/bin:/Users/jeffskelton/.scripts/bin:/Users/jeffskelton/.volta/bin:/opt/homebrew/bin:/opt/homebrew/sbin'

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

load-aws-credentials() {
  if [[ $AWS_SECRET_ACCESS_KEY = "" || $AWS_ACCESS_KEY_ID = "" ]]; then

    if [ -s "$HOME/.aws/set-aws-env-vars.sh" ]; then

      . $HOME/.aws/set-aws-env-vars.sh

      if [[ $AWS_SECRET_ACCESS_KEY = "" || $AWS_ACCESS_KEY_ID = "" ]]; then
        echo "ERROR: SETTING AWS CREDENTIALS DID NOT WORK. Please check ~/.aws/set-aws-env-vars.sh for errors"
      fi

    else
      echo "AWS_ACCESS_KEY_ID and/or AWS_SECRET_ACCESS_KEY are not set and ~/.aws/set-aws-env-vars.sh is missing"
    fi
  fi
}

set-up-jira-cli-completions() {
  eval "$(jira --completion-script-bash)"
}

set-up-todoist-cli() {
  # obviously this will only work on MacOs with homebrew installed
  source $(brew --prefix)/share/zsh/site-functions/_todoist_fzf

  # PROG=todoist source "$GOPATH/src/github.com/urfave/cli/autocomplete/zsh_autocomplete"
}

complete -C '/usr/local/bin/aws_completer' aws


# init-asdf-options
automatically-start-tmux
set-up-todoist-cli
# load-aws-credentials
# set-up-jira-cli-completions

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
alias emc='emacsclient -cnt'
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
alias ssh='mosh'
alias startd6='. /Users/jeffskelton/Projects/Deep6/application-team-scripts/frankenscript/frankenscript.sh'

eval "$(rbenv init - zsh)"
eval "$(pyenv init --path)"
eval "$(starship init zsh)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
