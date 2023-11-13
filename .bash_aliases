alias ec=emacsclient
alias hx='hexdump -C'
alias ll='ls -alF --color=always'
alias dir='ll'

alias xclip='xclip -selection c'
# alias tree='tree -a'
# alias less='less -r'

alias gita='git add --all'
alias gitc='git commit -m'
alias gitd='git diff --cached --color'
alias gits='git status'
alias gitl='git log --oneline --graph --color --all --decorate'
alias gitl-date='git log --oneline --graph --color --all --pretty=format:'\''%C(auto)%h%C(blue) %<|(19)%as%C(auto)%d %s'\'''

see-path () {
   echo ${1:-$PATH} | tr ":" "\n"
}
