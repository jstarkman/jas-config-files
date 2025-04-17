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

alias dockerr='docker run --rm -it --entrypoint sh'
alias podmanr='podman run --rm -it --entrypoint sh'
alias dockere='docker exec -it'
alias podmane='podman exec -it'

see-path () {
   echo ${1:-$PATH} | tr ":" "\n"
}

alias crc32-hex='gzip -1 -c | tail -c8 | od -A n -N 4 -t x4'
alias crc32-int32='gzip -1 -c | tail -c8 | od -A n -N 4 -t d4'
alias crc32-uint32='gzip -1 -c | tail -c8 | od -A n -N 4 -t u4'
