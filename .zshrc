# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh
source ~/.autoenv/activate.sh


# User configuration

export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nano'
 else
   export EDITOR='emacs'
 fi

# Compilation flags
export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd extendedglob nomatch notify
unsetopt beep
bindkey -e

HISTCONTROL=ignoreboth

# Zsh konfiguráció

# Aliases
# Composer aliasok
alias composer="php /usr/local/bin/composer"

# Laravel parancsok gyorsítása
alias tinker="php artisan tinker"
alias a="php artisan"
alias ac="php artisan config:cache"
alias aup="php artisan up"
alias adown="php artisan down"
alias at="php artisan serve"
alias amigrate="php artisan migrate"
alias amake="php artisan make:model"
alias amakecontroller="php artisan make:controller"
alias amakeview="php artisan make:view"
alias composerupdate="composer update"
alias composerinstall="composer install"
alias composerdump="composer dump-autoload"
alias lnew="composer create-project --prefer-dist laravel/laravel"
alias ls="php artisan serve"
alias lcache="php artisan cache:clear"
alias lopt="php artisan optimize"
alias lmake="php artisan make:model"


# Node.js aliasok
alias npm="npx npm"
alias yarn="npx yarn"
# Node.js verzió váltás
alias usenode="nvm use"
alias npmi="npm install"
alias npmstart="npm start"
alias npmbuild="npm run build"
alias npmdev="npm run dev"
alias npmlog="npm run log"

# React starter project (csak új projektnél)
alias create-react="npx create-react-app"
alias reactstart="npm start"
alias reactbuild="npm run build"
alias reactdev="npm run dev"
# Tailwind CSS build parancsok
alias tw="npx tailwindcss build"
#alias tailwindbuild="npx tailwindcss -o public/css/tailwind.css"
# Tailwind build parancs
alias tailwindbuild="npx tailwindcss -o public/css/tailwind.css --watch"


# Fájlok gyors keresése
alias fzfsearch="fzf --preview 'cat {}'"

# Git fájlok keresése
alias fzfgit="git ls-files | fzf"

# Projekten belüli gyors navigáció
alias fzfd="find . -type d | fzf"
alias gs="git status"
alias gl="git log --oneline --graph"
alias ga="git add ."
alias gc="git commit -m"
alias gco="git checkout"
alias gpo="git push origin"
alias gpl="git pull origin"

# Make build parancsok
alias makebuild="make"
alias cmakebuild="cmake . && make"
# Python virtualenv aliasok
alias venv="python3 -m venv"
alias activate="source venv/bin/activate"
alias pipinstall="pip install"
alias pipupdate="pip install --upgrade"
# Maven build aliasok
alias mvnbuild="mvn clean install"

alias ll='ls -l'
#alias la='ls -la'
alias la='ls -A'
alias l='ls -CF'
alias ls='ls --color=auto'
alias man='man -L hu'
alias doc='dpkg-query -L'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'


# Prompt testreszabás
PROMPT='%F{green}%n@%m%f:%F{blue}%~%f$ '

# Környezeti változók
export PATH="/home/zsolt/.nvm/versions/node/v18.20.8/bin:/usr/local/bin:$HOME/.local/bin:$HOME/.config/composer/vendor/bin:/usr/local/bin:/usr/bin:/usr/sbin:/bin:/sbin:/home/zsolt/bin:/usr/lib:$PATH"
export JAVA_HOME=/usr/lib/jvm/java-25-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH
# C++ specifikus környezeti változók (pl. a helyi C++ környezet beállítása)
export CXX=/usr/bin/g++


plugins=(
  git
  zsh-completions
  zsh-autosuggestions
  zsh-syntax-highlighting
  pyenv
  git
  npm
  nvm
  python
  docker
)



[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
