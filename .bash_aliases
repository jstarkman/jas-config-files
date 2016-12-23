alias sagi='sudo apt-get install'
alias ec=emacsclient
alias hx='hexdump -C'
alias fn='find . -name'
alias ll='ls -alF --color=always'
alias dir='ll'
alias see_path='echo $PATH | tr ":" "\n"'

alias xclip='xclip -selection c'
alias tree='tree -a'
alias less='less -r'

alias gitl='git log --oneline --graph --color --all --decorate'
alias gits='git status'

alias ckm='cd ~/ros_ws && catkin_make'
alias eb='rosrun baxter_tools enable_robot.py'

alias dog='pygmentize -g -O linenos=1'

dogl () {
   dog $1 | less -r
}

