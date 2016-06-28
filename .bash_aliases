alias sagi='sudo apt-get install'
alias ec=emacsclient
alias hx='hexdump -C'
alias fn='find . -name'

alias xclip='xclip -selection c'
alias tree='tree -a'
alias less='less -r'

alias gita='git add'
alias gitb='git branch'
alias gitc='git commit'
alias gitm='git merge --no-ff'
alias gitl='git log --oneline --graph --color --all --decorate'
alias gits='git status'

alias dog='pygmentize -g -O linenos=1'

dogl () {
   dog $1 | less -r
}
