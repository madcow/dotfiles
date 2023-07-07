# Running interactive?
if [[ $- != *i* ]]; then
	return;
fi

shopt -s checkwinsize   # Update window size
shopt -s histappend     # Append to history file
shopt -s globstar       # Match "**" wildcard

HISTCONTROL=ignoredups  # Ignore duplicate lines
HISTFILESIZE=10000      # Maximum stored history lines
HISTSIZE=1000           # Maximum lines per session

# Terminal prompt and color settings
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
	export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
else
	PS1='\u@\h:\w\$ '
fi

# Color settings by file type
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# Programmable completion
if ! shopt -oq posix; then 
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi

# Custom bash aliases
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi
