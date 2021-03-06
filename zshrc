 #If you come from bash you might have to change your $PATH.
#
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ROOTSYS=/usr/local/Cellar/root/6.12.04_1
export PYTHON3PATH=$ROOTSYS/lib/root:$PYTHON3PATH
export PYTHONPATH=$ROOTSYS/lib/root:$PYTHONPATH
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# tex folder on osx
export PATH=$PATH:/Library/TeX/texbin


export CLICOLOR=YES # dir colors

LS_COLORS='no=00;37:fi=00:di=00;33:ln=04;36:pi=40;33:so=01;35:bd=40;33;01:'
LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'
export LS_COLORS
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="sunaku"
ZSH_THEME="bunnyruni"
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
#plugins=(git)
plugins=(zsh-autosuggestions)

#git config --add oh-my-zsh.hide-status 1
#git config --add oh-my-zsh.hide-dirty 1


source $ZSH/oh-my-zsh.sh
# path to belle2 releases

export ZSHRC=$HOME/dot_files/zshrc
export VIMRC=$HOME/dot_files/vimrc

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=30"

setopt no_share_history

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
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


# FUNCTIONS 

function jupyter_notebook {
    jupyter notebook --no-browser --port=8212
}

alias htop='glances'
alias ls='gls -AFh  --color=auto'
alias wow='open ./Desktop/.games/WoW-1.12.1-enUS-Mac\ 2/WoW.app'
#alias ls='ls -lAFh --color=tty'
#alias grep="grep -rn"

