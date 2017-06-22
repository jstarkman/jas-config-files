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
includeViaSourcing /opt/ros/kinetic/setup.bash

## tell ros about our new packages
includeViaSourcing ~/ros_ws/devel/setup.bash

here=~/jas-config-files

## put a useful tool on the path
PATH=$PATH:$HOME/ros_ws/src/learning_ros_external_packages

## put own scripts on path
PATH=$here/bin:$PATH

# put `pip install --user <packages> on the path
PATH=$PATH:~/.local/bin

## Aliases!
. $here/.bash_aliases

## Other
export LUA_PATH="$here/lua-includes/?.lua;$LUA_PATH"
export EDITOR=vi
export VISUAL=vi

## keyboard remapping.  Program runs in background
xcapeConfig='Shift_L=Shift_L|parenleft;Shift_R=Shift_R|parenright'
ps cax | grep xcape > /dev/null
if [ $? -ne 0 ]; then
   xcape=`which xcape`
   if [ $xcape = "" ]; then
      # https://github.com/alols/xcape
      git clone https://github.com/alols/xcape.git
      cd xcape
      make
      xcape=`pwd`/xcape
      cd -
   fi
   $xcape -e $xcapeConfig
fi

# infinite history
# https://stackoverflow.com/a/19533853
shopt -s histappend
export HISTSIZE=
export HISTFILESIZE=

# Android
export ANDROID_HOME=~/Android/Sdk/
export EIGEN3_INCLUDE_DIR=/usr/include/eigen3/
