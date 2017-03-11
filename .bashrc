# My extras for .bashrc

## turn the prompt yellow (easy to see against purple) and add a leading newline
. /etc/lsb-release
if [[ $DISTRIB_ID != "Ubuntu" || $DISTRIB_RELEASE == 16.04 ]]
then
   oldPS1=$PS1
   PS1="\n\[\e[0;33m\]$oldPS1\[\e[0m\]"
fi

includeViaSourcing () {
    [[ -f "$1" ]] && source "$1"
}

## run ros setup
includeViaSourcing /opt/ros/indigo/setup.bash

## tell ros about our new packages
includeViaSourcing ~/ros_ws/devel/setup.bash

here=~/jas-config-files

## put a useful tool on the path
PATH=$PATH:$HOME/ros_ws/src/learning_ros_external_packages

## put own scripts on path
PATH=$here/bin:$PATH

## Aliases!
. $here/.bash_aliases

## Lua
LUA_PATH="$here/lua-includes/?.lua;$LUA_PATH"
