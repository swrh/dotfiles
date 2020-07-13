" .config/nvim/init.vim

" save before commands like :next and :make
set autowrite           " save before commands like :next and :make
set hlsearch            " switch on highlighting the last used search pattern
set mouse=a             " enable mouse control

set cinoptions=:0,l1,g0,t0
let g:load_doxygen_syntax=1

" ignore some files
set wildignore+=moc_*.cpp,*.o,*.so,*.exe,*.dll,*.class,*.pyc

" set file searching path (^wf, gf)
set path=.,./include,../include,../../include,/usr/include,/usr/local/include

" suffixes that get lower priority when doing tab completion for filenames
" these are files we are not likely to want to edit or read
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

if &term =~ "xterm"
  set title             " let the title stuff work
endif

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

autocmd FileType html setlocal sw=2 et
autocmd FileType yaml setlocal sw=2 et
autocmd FileType json setlocal sw=2 et
autocmd FileType javascript setlocal sw=2 et
autocmd FileType typescript setlocal sw=2 et
autocmd FileType cpp setlocal sw=4 ts=4 et tw=120

" vim:set ft=vim:
" vi:set et sw=2 tw=78:
