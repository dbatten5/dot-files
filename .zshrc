# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/dombatten/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="theunraveler"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  z
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias v='nvim .'
alias vim='nvim'
alias n='nvim .'
alias c="clear"
alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'
alias gbd='git branch --merged | egrep -v "(^\*|master|dev|staging|develop)" | xargs git branch -d'
alias k='kubectl'
alias h='helm'
alias k8='kubectl apply -f k8s/'
alias penv='python3 -m venv'
alias ret='RAILS_ENV=test'
alias plop='./node_modules/.bin/plop'
alias ez='vim ~/.zshrc'
alias sz='source ~/.zshrc'
alias bashprod='kubectl config use-context arn:aws:eks:eu-west-1:531760263420:cluster/production && kubectl --namespace jx-production exec $(kubectl get pods --all-namespaces | grep jx-production-web | head -n1 | tr -s " " | cut -d" " -f2) -ti bash'
alias kdev='kubectl config use-context arn:aws:eks:eu-west-1:531760263420:cluster/development'
alias e2e='scripts/e2e'
alias gpf='ggpush --force-with-lease'
alias gfc='git commit --fixup'
alias grbm='git pull --rebase=interactive origin master'

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

export PATH="/usr/local/sbin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Add go path
export PATH=$PATH:/usr/local/go/bin
export PATH=~/.local/bin:$PATH

export PATH=/usr/local/share/python:$PATH
export PATH=/usr/local/Cellar/postgresql@9.5/9.5.x/bin:$PATH
export PATH="/usr/local/opt/postgresql@9.5/bin:$PATH"

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

function klog() {
  local pr=$1
  local container_name="${2:-preview}"

  local namespace="$(prns $pr)"
  local first_pod="$(firstpod $pr)"

  kubectl --namespace $namespace logs $first_pod -f -c $container_name
}

function kexec() {
  local pr=$1
  local container_name="${2:-preview}"

  local namespace="$(prns $pr)"
  local first_pod="$(firstpod $pr)"

  kubectl --namespace $namespace exec -it $first_pod -c $container_name -- /bin/bash
}

function firstpod() {
  local pr=$1
  local namespace="$(prns $pr)"

  local pods_output="$(kubectl get pods --namespace $namespace)";

  echo $pods_output | grep -ow '^jx\-[^ ]*'
}

function prns() {
  local pr=$1

  echo "jx-appearhere-web-pr-$pr"
}

function upload_email() {
  declare -a arr=("en" "en-US" "fr")
  # declare -a arr=("fr")
  for i in "${arr[@]}"
  do
    bundle exec dotenv mandrilltemplate upload $1"-"$i
  done
}

function publish_email() {
  declare -a arr=("en" "en-US" "fr")
  for i in "${arr[@]}"
  do
    bundle exec dotenv mandrilltemplate publish $1"-"$i
  done
}

function check_port() {
  lsof -i tcp:$1
}

function packs() {
  if [ "$1" = "all" ]; then
    rm client/packs/*
    echo "Done"
    return 1
  fi

  local root="client/packs"
  declare -a packs=(
    "additions"
    "cutouts"
    "dashboard_additions"
    "editorial"
    "extensions"
    "found"
    "landing_pages"
    "spaceforideas"
    "offers_show"
  )

  for i in "${packs[@]}"
  do
    local pack=$root/$i.js
    [ -f "$pack" ] && { echo "Removing $i"; rm $pack }
  done
}

function fixup() {
  local current_sha="$(git rev-parse HEAD)"

  git commit --fixup $current_sha
}

export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
