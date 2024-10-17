set number
set textwidth=70

" Easier to see on black backgrounds (e.g., PuTTY)
highlight comment ctermfg=cyan

" Helps reduce typos
:command Q quit

" Easier than invoking :noh every time; source: https://stackoverflow.com/a/657484
nnoremap / :let @/=""<CR>/
