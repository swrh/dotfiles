" .config/nvim/init.vim

" save before commands like :next and :make
set autowrite           " save before commands like :next and :make
set hlsearch            " switch on highlighting the last used search pattern
set mouse=a             " enable mouse control

set path=.,./include,../include,../../include,/usr/include,/usr/local/include

" list & listchars
set list listchars=eol:$,tab:>.,trail:.

" previous and next opened file
map <f9> :prev<cr>z.
map <f10> :next<cr>z.

" previous and next compiler error (quickfix)
map <c-p> :cprev<cr>z.:cc<cr>
map <c-n> :cnext<cr>z.:cc<cr>

" git grep function
func GitGrep(...)
  let save = &grepprg
  set grepprg=git\ grep\ -n\ $*
  let s = 'grep'
  for i in a:000
    let s = s . ' ' . i
  endfor
  exe s
  let &grepprg = save
endfun
command -nargs=+ -complete=file G call GitGrep(<f-args>)

" search for the current word in git
nmap <leader>g :let @/ = '\<<c-r>=expand('<cword>')<cr>\>'<cr><leader>G
nmap <leader>G :silent G '<c-r>/'<cr>:redraw!<cr>:cc<cr>z.

" search for the current word in C/C++, Python and make files
nmap <leader>v :let @/ = '\<<c-r>=expand('<cword>')<cr>\>'<cr><leader>V
nmap <leader>V :silent vimgrep /<c-r>// **/*.[CcHh] **/*.[ch]pp **/*.cc **/*.py **/Makefile **/*.java **/*.xml **/*.txt **/*.cmake **/*.proto *.sh<cr>z.

" ctags ftw
nmap <leader>tf :!rm -f tags && find . -name '*.[ch]pp' -or -name '*.[ch]' -or -name '*.py' -print0 \| xargs -0 ctags -a<cr>
nmap <leader>tg :!rm -f tags && git ls-files -z \| xargs -0 ctags -a<cr>

" persistent undo
if version >= 703
  if !isdirectory($HOME.'/.vim')
    call mkdir($HOME.'/.vim', '', 0770)
  endif
  if !isdirectory($HOME.'/.vim/undo')
    call mkdir($HOME.'/.vim/undo', '', 0700)
  endif
  set undofile
  set undodir=~/.vim/undo
  set undoreload=10000
endif
set undolevels=1000

autocmd FileType yaml setlocal sw=2 et

call plug#begin()
call plug#end()

" vim:set ft=vim:
" vi:set et sw=2 tw=78:
