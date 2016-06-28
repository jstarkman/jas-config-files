alias sagi='sudo apt-get install'
alias dog='pygmentize -g -O linenos=1'
alias ec=emacsclient
alias hx='hexdump -C'
alias xclip='xclip -selection c'

alias tree='tree -a'
alias less='less -r'

alias gita='git add'
alias gitb='git branch'
alias gitc='git commit'
alias gitm='git merge --no-ff'
alias gitl='git log --oneline --graph --color --all --decorate'
alias gits='git status'

dogl () {
   dog $1 | less -r
}
