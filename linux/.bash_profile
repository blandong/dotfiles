# .bash_profile
#set bash keybindings to vi mode
#set -o vi

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$(find /export/home/bdong/ss -type d -printf ":%p"):/export/home/bdong/.local/bin:$PATH:$HOME/bin

export PATH

alias cls="clear; printf '\033[3J'"
alias vid="vi -S Session.vim"
alias dfs="cd ~/git_projects/dotfiles/; ll"
export dfs="/export/home/bdong/git_projects/dotfiles/"
alias dp="cd /covisint/scripts/deployment/iam-deployment/iam;ll"
alias sc="cd /covisint/scripts/deployment/iam-deployment/nextgenproduct/scripts;ll"
alias jmeter_bin="cd /covisint/loadtesting/apache-jmeter-3.0/bin; ll"
alias jmeter_scripts="cd /covisint/loadtesting/projects/platform/ServiceBasedTests/End2End/Legacy/scripts/; ll"
alias jmeter_result="cd /covisint/loadtesting/projects/platform/ServiceBasedTests/End2End/Legacy/; ll"
alias ss="cd ~/ss;ll"
export ss="/export/home/bdong/ss"
test -e ~/.iterm2_shell_integration.bash && source ~/.iterm2_shell_integration.bash || true

alias gt="git tag"
alias gs="git status"
alias gb="git branch"
alias ga="git add"
alias gps="git push"
alias gcm="git commit"

