#set bash keybindings to vi mode
set -o vi

#used by vim to expand alias set here
shopt -s expand_aliases  

#open bash editor with nvim when type v from bash shell
#export VISUAL=/usr/local/bin/nvim
#export EDITOR=/usr/local/bin/nvim

export VISUAL=/usr/bin/vim
export EDITOR=/usr/bin/vim

alias cls="clear; printf '\033[3J'"
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_311.jdk/Contents/Home
export PATH=$(find /Users/bdong/Dropbox/Documents/shell_scripts -type d -maxdepth 1 | paste -sd ":" -):/usr/local/opt/curl/bin:/Users/bdong/.jenv/bin:/usr/local/opt/gnu-sed/libexec/gnubin:$PATH:/usr/local/Cellar/apache-cassandra/3.11/bin:/Users/bdong/apps/instantclient_19_8/

alias kc="kubectl"
alias ss="cd /Users/bdong/Dropbox/Documents/shell_scripts; ls -la"
alias e="base64"
alias d="base64 -d"
#alias vi="nvim"
: '
alias c_dev="cqlsh localhost 9040 -u plat_authn_dev_admin -p e2drMQLUTKFP9uAs"
eval "$(jenv init -)"


alias c_us="cqlsh localhost 9043 -u plat_authn_prod_admin -p VPr82Qzx"
alias c_fra="cqlsh localhost 9044 -u plat_authn_prod_admin -p 4tzzi9Cb"
alias c_china="cqlsh localhost 9045 -u plat_authn_prod_admin -p p7vqTbX2"

#alias py="python3"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
source <(kubectl completion bash | sed 's/kubectl/kc/g')

complete -C /usr/local/bin/vault vault
eval export PATH="/Users/bdong/.jenv/shims:${PATH}"
export JENV_SHELL=bash
export JENV_LOADED=1
#unset JAVA_HOME
source '/usr/local/Cellar/jenv/0.5.4/libexec/libexec/../completions/jenv.bash'
jenv rehash 2>/dev/null
jenv refresh-plugins
jenv() {
  typeset command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  enable-plugin|rehash|shell|shell-options)
    eval `jenv "sh-$command" "$@"`;;
  *)
    command jenv "$command" "$@";;
  esac
}


#For compilers to find openssl@3
export LDFLAGS="-L/usr/local/opt/openssl@3/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@3/include"

#For pkg-config to find openssl@3 
export PKG_CONFIG_PATH="/usr/local/opt/openssl@3/lib/pkgconfig"

#For compilers to find sqlite
export LDFLAGS="-L/usr/local/opt/sqlite/lib"
export CPPFLAGS="-I/usr/local/opt/sqlite/include"

#For pkg-config to find sqlite
export PKG_CONFIG_PATH="/usr/local/opt/sqlite/lib/pkgconfig"

#For compilers to find zlib
export LDFLAGS="-L/usr/local/opt/zlib/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include"

#For pkg-config to find zlib
export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig"


export PATH="/Users/bdong/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"

alias python="$(pyenv which python)"
alias py="$(pyenv which python)"
alias pip="$(pyenv which pip)"
'
test -e ~/.iterm2_shell_integration.bash && source ~/.iterm2_shell_integration.bash || true
