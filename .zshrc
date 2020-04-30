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
# plugins=(brew colored-man colorize git heroku docker osx rails ruby tmux tmuxinator vagrant virtualenv vundle zsh-syntax-highlighting)
# github

# export ZSH_TMUX_AUTOSTART=true
# export TERM=screen-256color

source $ZSH/oh-my-zsh.sh

# # Disable flow control commands (keeps C-s from freezing everything)
# stty start undef
# stty stop undef

export PATH="./bin:./node_modules/.bin:/Users/pain/.rbenv/shims:/Users/pain/.rbenv/bin:/usr/local/sbin:/usr/local/bin:/usr/local/share/npm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/share/zsh-completions"
export EDITOR='vim'
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

alias bu="brew update && brew upgrade && brew cask upgrade && brew cleanup -s && brew doctor"
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
alias mux="tmuxinator"
alias uuid="uuidgen | tr -d '\n-' | tr '[:upper:]' '[:lower:]' | pbcopy && pbpaste && echo"
alias gst="git status"
alias did="vim +'normal Go' +'r!date' ~/did.txt"
alias commitdiff="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative HEAD..$1"
is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

gf() {
  is_in_git_repo &&
    git -c color.status=always status --short |
    fzf --height 40% -m --ansi --nth 2..,.. | awk '{print $2}'
}

gbranch() {
  is_in_git_repo &&
    git branch -a -vv --color=always | grep -v '/HEAD\s' |
    fzf --height 40% --ansi --multi --tac | sed 's/^..//' | awk '{print $1}' |
    sed 's#^remotes/[^/]*/##'
}

gtag() {
  is_in_git_repo &&
    git tag --sort -version:refname |
    fzf --height 40% --multi
}

ghead() {
  is_in_git_repo &&
    git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph |
    fzf --height 40% --ansi --no-sort --reverse --multi | grep -o '[a-f0-9]\{7,\}'
}

gremote() {
  is_in_git_repo &&
    git remote -v | awk '{print $1 " " $2}' | uniq |
    fzf --height 40% --tac | awk '{print $1}'
}

bindkey '\er' redraw-current-line

zle -N gf
bindkey '^g^f' gf
zle -N gbranch
bindkey '^g^b' gb
zle -N gtag
bindkey '^g^t' gt
zle -N ghead
bindkey '^g^h' gh
zle -N gremote
bindkey '^g^r' gr

export PATH=./bin:${PATH}:/usr/local/mysql/bin
. `brew --prefix`/etc/profile.d/z.sh

export BUNDLER_EDITOR=vim
export LC_COLLATE=C
export LC_CTYPE="en_US.UTF-8"
export LANG="en_US.UTF-8"
export FZF_DEFAULT_COMMAND='ag -l -g ""'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
stty -ixon
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PATH="$HOME/.yarn/bin:$PATH"
# export RUBYOPT=--enable-frozen-string-literal
# source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# export DOCKER_HOST=tcp://127.0.0.1:4243

fpath=(/usr/local/share/zsh-completions $fpath)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/pain/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/pain/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/pain/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/pain/google-cloud-sdk/completion.zsh.inc'; fi

source ~/.zshenv
source ~/.zshrc.local
export PATH="/usr/local/opt/node@10/bin:$PATH"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/mc mc
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
