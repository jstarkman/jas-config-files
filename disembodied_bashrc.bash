# My extras for .bashrc

## turn the prompt yellow (easy to see against purple) and add a leading newline
oldPS1=$PS1
PS1="\n\[\e[0;33m\]$oldPS1\[\e[0m\]"

## run ros setup
source /opt/ros/indigo/setup.bash

## tell ros about our new packages
source ~/ros_ws/devel/setup.bash

## put a useful tool on the path
PATH=$PATH:/home/jas497/ros_ws/src/learning_ros_external_packages

## useful aliases
alias ckm='cd ~/ros_ws && catkin_make'
