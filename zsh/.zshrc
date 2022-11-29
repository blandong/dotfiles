# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
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
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_sOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(zsh-autosuggestions z zsh-history-substring-search zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# Only changing the escape key to `jk` in insert mode, we still
# keep using the default keybindings `^[` in other modes
#ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
#export VI_MODE_SET_CURSOR=true
#ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BEAM
#ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK
#ZVM_OPPEND_MODE_CURSOR=$ZVM_CURSOR_UNDERLINE
# Always starting with insert mode for each command line
#ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT

#ZVM_CURSOR_STYLE_ENABLED=false
#echo '\e[5 q'
#ZVM_VI_EDITOR=/usr/local/bin/vim

alias cls="clear; printf '\033[3J'"
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_311.jdk/Contents/Home
export PATH=$(find /Users/bdong/Dropbox/Documents/shell_scripts -type d -maxdepth 1 | paste -sd ":" -):/usr/local/opt/curl/bin:/Users/bdong/.jenv/bin:/usr/local/opt/gnu-sed/libexec/gnubin:$PATH:/usr/local/Cellar/apache-cassandra/3.11/bin:/Users/bdong/apps/instantclient_19_8/

alias kc="kubectl"
alias ss="cd /Users/bdong/Dropbox/Documents/shell_scripts"
#https://stackoverflow.com/questions/17958567/how-to-make-an-alias-for-a-long-path
#use cd $ss to cd to the /Users/bdong/Dropbox/Documents/shell_scripts
export ss="/Users/bdong/Dropbox/Documents/shell_scripts"
export doc="/Users/bdong/Dropbox/Documents"

alias vid="vi -S /Users/bdong/Dropbox/Documents/Session.vim"
alias vit="vim -c ':term ++curwin'"

alias ll="ls -la"

alias gt="git tag"
alias gs="git status"
alias gb="git branch"
alias ga="git add"
alias gps="git push"
alias gcm="git commit -m"
alias gcp="git cherry-pick"
alias gdt="git difftool"

test -e /Users/bdong/.iterm2_shell_integration.zsh && source /Users/bdong/.iterm2_shell_integration.zsh || true


# Enable vi mode
bindkey -v
bindkey -M viins 'jk' vi-cmd-mode
export EDITOR='vim'

#enter edit mode once v is pressed in command line
autoload edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[2 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[6 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[6 q"
}
zle -N zle-line-init
echo -ne '\e[6 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[6 q' ;} # Use beam shape cursor for each new prompt.

#remove zsh line editor binding for both emac and vi
#https://superuser.com/questions/928846/what-is-execute-on-the-command-line-and-how-to-i-avoid-it
#bindkey -e -r '^[x'
#bindkey -a -r ':'

#bind ,l to autosuggest-accept of zsh-autosuggestions plugin
bindkey ',l' autosuggest-accept
#https://github.com/zsh-users/zsh-autosuggestions/issues/265
bindkey ',w' vi-forward-word


#substring history
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

#prevent duplicate history when using up/down arrow to see history command
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

# eval $(thefuck --alias)
# You can use whatever you want as an alias, like for Mondays:
# eval $(thefuck --alias FUCK)

