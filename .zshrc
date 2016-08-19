# brew-cask && brew cleanup && brew cask cleanup"
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
ZSH_THEME="bira"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# plugins=(osx git sublime tmux tmuxinator vundle rails ruby heroku)
plugins=(brew colored-man colorize git heroku knife osx rails ruby tmux tmuxinator vagrant virtualenv vundle zsh-syntax-highlighting)
# github

# export ZSH_TMUX_AUTOSTART=true
export TERM=xterm-256color

source $ZSH/oh-my-zsh.sh

# # Disable flow control commands (keeps C-s from freezing everything)
# stty start undef
# stty stop undef

export PATH="./bin:./node_modules/.bin:/Users/pain/.rbenv/shims:/Users/pain/.rbenv/bin:/usr/local/sbin:/usr/local/bin:/usr/local/share/npm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/share/zsh-completions"
export EDITOR='vim'
alias viber=/Applications/Viber.app/Contents/MacOS/Viber
# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

alias bu="brew update && brew upgrade --all && brew cleanup && brew doctor"
alias d="git push && cap deploy"
alias diff="colordiff"
alias fuck='$(thefuck $(fc -ln -1))'
alias gc='git diff --name-only | if xargs grep -q -nr -e "focus: true"; then; git commit; else echo "rejected commit" fi; fi'
alias v="vagrant"
alias vagrant="/opt/vagrant/bin/vagrant"
alias vimrc="vim ~/.vimrc"
alias nvimrc="vim ~/.config/nvim/init.vim"
alias vi="`which vim`"
alias vim="nvim"
alias e="nvim"

export PATH=./bin:${PATH}:/usr/local/mysql/bin
. `brew --prefix`/etc/profile.d/z.sh

export BUNDLER_EDITOR=vim
export LC_COLLATE=C
export LC_CTYPE="en_US.UTF-8"
export FZF_DEFAULT_COMMAND='ag -l -g ""'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
stty -ixon
source ~/.zshrc.local
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
