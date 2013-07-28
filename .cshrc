# $FreeBSD: src/share/skel/dot.cshrc,v 1.14.10.1.2.1 2009/10/25 01:10:29 kensmith Exp $
#
# .cshrc - csh resource script, read at beginning of execution by each shell
#
# see also csh(1), environ(7).
#

alias h		history 25
alias j		jobs -l
alias la	ls -a
alias lf	ls -FA
alias ll	ls -lA

alias dcvs env CVS_RSH=ssh cvs -d sat@dcvs.freebsd.org:/home/dcvs
alias pcvs env CVS_RSH=ssh cvs -d sat@pcvs.freebsd.org:/home/pcvs
alias projcvs env CVS_RSH=ssh cvs -d sat@projcvs.freebsd.org:/home/projcvs
alias scvs env CVS_RSH=ssh cvs -d sat@ncvs.freebsd.org:/home/ncvs
alias rucvs env CVS_RSH=ssh cvs -d sat@frdp.freebsd.org.ua:/home/rucvs

# A righteous umask
umask 22

set path = (/sbin /bin /usr/sbin /usr/bin /usr/games /usr/local/sbin /usr/local/bin $HOME/bin)
set echo_style = both

setenv	EDITOR	vi
setenv	PAGER	more
setenv	BLOCKSIZE	K
setenv	MAIL_AGENT	"msmtp -t"
setenv	FUSE_DEV_NAME	/dev/fuse0

if ($?prompt) then
	# An interactive shell -- set some stuff up
	if (`id -u` != '0') then
		set prompt="%B%n%b@%B%m%b:%~> "
	else
		set prompt="%B%n%b@%B%m%b:%~# "
	endif
	set filec
	set history = 2500
	set savehist = 2500
	set mail = (/var/mail/$USER)
	if ( $?tcsh ) then
		bindkey "^W" backward-delete-word
		bindkey -k up history-search-backward
		bindkey -k down history-search-forward
	endif
endif

if ( "$TERM" == "xterm" || "$TERM" == "network" ) then
	alias  label  'echo -n "\033]2;\!*\007"'  # title of window
	alias  icon   'echo -n "\033]1;\!*\007"'  # title of icon
	alias  swd    'label `whoami`@`hostname`:`dirs`; icon `hostname`.`whoami`:`dirs`'
	swd
	alias cd  'cd \!*; swd'
	alias ssh 'ssh \!*; swd'
endif
