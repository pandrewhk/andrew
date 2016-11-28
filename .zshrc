alias h="history 25"
alias j="jobs -l"
alias la="ls -a"
alias lf="ls -FA"
alias ll="ls -lA"

#Special
function ssh() {
  if [ "`uname`" != "Darwin" ];then
  export SSH_AUTH_SOCK=`ls -t /tmp/ssh-*/agent*|head -n1`
  fi
  cur=`tmux lsw | grep -m1 "[:] ssh $* "|cut -f1 -d:`
  if [ -n "$cur" ];then
	  tmux selectw -t :$cur
  else
	  tmux neww -n "ssh $*" "ssh $*"
  fi
}

export PATH=/usr/local/opt/ruby/bin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/usr/games:/usr/local/sbin:/usr/ports/Tools/scripts:/usr/local/zvq/sbin:/usr/local/zvq/bin:$HOME/bin:/usr/local/libexec/rancid:$PATH
export PATH=$PATH:$HOME/adt/sdk/tools:$HOME/adt/sdk/platform-tools
export NODE_PATH=/usr/local/lib/node_modules
export EDITOR=vim
export PSQL_EDITOR="vim -c 'set ft=sql'"
export VISUAL=vim
export EMAIL=infofarmer@gmail.com
export MAILDIR=$HOME/Maildir
export MAILCAPS=$HOME/.mailcap
export PAGER="less -i"
export MAIL_AGENT="msmtp -t"

HISTFILE=$HOME/.zshist
HISTSIZE=20000
SAVEHIST=20000
DIRSTACKSIZE=50
PROMPT="%{[33m%}%B%n%b@%{[33m%}%B%m%b%#%{[0m%} "
RPROMPT="%{[1;33m%}%/%{[0m%}"
REPORTTIME=15

setopt no_beep
setopt auto_cd
setopt auto_pushd
setopt cdable_vars
setopt chase_links
setopt pushd_ignore_dups

setopt complete_in_word
setopt glob_complete
setopt hash_list_all
setopt list_types

setopt bad_pattern
setopt bare_glob_qual
setopt equals
setopt extended_glob
setopt glob
setopt nomatch
setopt numeric_glob_sort
setopt rc_expand_param
setopt multibyte

#setopt share_history
setopt inc_append_history
#setopt no_extended_history
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_verify
# To allow shared history with root
setopt no_hist_save_by_copy

setopt multios
setopt notify
autoload -Uz zmv
#autoload -Uz compinit
#zstyle :compinstall filename '$HOME/.zshrc'
#compinit -C

bindkey -v
#bindkey -rpM viins '^['
bindkey -M viins '^k' history-beginning-search-backward
bindkey -M viins '^j' history-beginning-search-forward
#stty start "^-" stop "^-"
#bindkey -M viins '\e[1~'   beginning-of-line
#bindkey -M viins '\e[4~'   end-of-line

export GIT_AUTHOR_NAME='Andrew Pantyukhin'
export GIT_AUTHOR_EMAIL='infofarmer@gmail.com'
export GIT_COMMITTER_NAME='Andrew Pantyukhin'
export GIT_COMMITTER_EMAIL='infofarmer@gmail.com'
export GIT_DISCOVERY_ACROSS_FILESYSTEM="YES"

export PERL_UNICODE='SDLA'
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LESSCHARSET='utf-8'

export HOMEBREW_GITHUB_API_TOKEN='ff7561c61c89d97d000292e36c9e7765275190b8'
