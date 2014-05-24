# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
setopt appendhistory beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/crozz/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo

typeset -A key

key[Home]=${terminfo[khome]}

key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

# setup key accordingly

[[ -n "${key[Home]}"     ]]  && bindkey  "${key[Home]}"     beginning-of-line
[[ -n "${key[End]}"      ]]  && bindkey  "${key[End]}"      end-of-line
[[ -n "${key[Insert]}"   ]]  && bindkey  "${key[Insert]}"   overwrite-mode
[[ -n "${key[Delete]}"   ]]  && bindkey  "${key[Delete]}"   delete-char
[[ -n "${key[Up]}"       ]]  && bindkey  "${key[Up]}"       up-line-or-history
[[ -n "${key[Down]}"     ]]  && bindkey  "${key[Down]}"     down-line-or-history
[[ -n "${key[Left]}"     ]]  && bindkey  "${key[Left]}"     backward-char
[[ -n "${key[Right]}"    ]]  && bindkey  "${key[Right]}"    forward-char
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"   beginning-of-buffer-or-history
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}" end-of-buffer-or-history

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.

if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
	function zle-line-init () {
		printf '%s' "${terminfo[smkx]}"
	}
	function zle-line-finish () {
		printf '%s' "${terminfo[rmkx]}"
	}
	zle -N zle-line-init
	zle -N zle-line-finish
fi

if [[ -f /etc/profile ]]; then
	. /etc/profile
fi

autoload -U colors && colors

export EDITOR="vim"

PATH=$PATH:$HOME/.bin
PATH=$PATH:$HOME/.arc4cc

alias ls='ls --color=auto'


#. $HOME/.zsh/profile.conf

#PS1=$'%{\e[0;31m%}[%{\e[0;37m%}%n@%m%{\e[0;31m%}:%{\e[0;37m%}%~%{\e[0;31m%}]%{\e[0;35m%}%#%{\e[0;0m%} '
PS1=$'%{\e[0;31m%}[%{\e[0;37m%}%n@%m%{\e[0;31m%}:%{\e[0;37m%}%~%{\e[0;31m%}]%{\e[0;35m%}%#%{\e[0;0m%} '
#PS1=$'\e[0;32m[%m]+ \e[0m'

