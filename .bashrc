PS1='$(c=${?##0};echo "\e[01;31m${c:+\$? $c }\e[00m")'"${PS1%\\$ }\n\\$ "

here=~/jas-config-files
# Are we in WSL?
if ! test -d "$here"; then
	echo "Please clone these config files under $here; now salvaging."
	here=/mnt/c/Users/jstarkman/jas-config-files
	if ! test -d "$here"; then
		echo 'These config files are not in a standard location.'
	fi
fi

PATH=$here/bin:$PATH
PATH=$PATH:~/.cargo/bin
. $here/.bash_aliases
unset here

export LUA_PATH="$here/lua-includes/?.lua;$LUA_PATH"
export EDITOR=vim
export VISUAL=vim

# infinite history
# https://stackoverflow.com/a/19533853
shopt -s histappend
export HISTSIZE=
export HISTFILESIZE=
