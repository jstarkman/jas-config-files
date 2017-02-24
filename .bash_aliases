alias sagi='sudo apt-get install'
alias ec=emacsclient
alias hx='hexdump -C'
alias fn='find . -name'
alias ll='ls -alF --color=always'
alias dir='ll'
alias see-path='echo $PATH | tr ":" "\n"'

alias xclip='xclip -selection c'
alias tree='tree -a'
alias less='less -r'

alias gita='git add --all'
alias gitc='git commit -m'
alias gitd='git diff --cached --color'
alias gitl='git log --oneline --graph --color --all --decorate'
alias gits='git status'
alias gcjas='git commit --author="James Starkman <-1@case.edu>"'

alias ckm='cd ~/ros_ws && catkin_make'
alias eb='rosrun baxter_tools enable_robot.py'

alias dog='pygmentize -g -O linenos=1'

dogl () {
   dog $1 | less -r
}

