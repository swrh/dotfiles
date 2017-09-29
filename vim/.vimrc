" .vimrc
"
" configuration file for vim
" written for Debian GNU/Linux by W.Akkerman <wakkerma@debian.org>
" some modifications by J.H.M. Dassen <jdassen@wi.leidenuniv.nl>
" even more modifications by Fernando Silveira <fsilveira@gmail.com>

" normally we use vim-extensions. if you want true vi-compatibility
" comment the following statements
set nocompatible        " use vim defaults (much better!)
"set compatible          " real vi mode
"set backspace=indent,eol,start  " more powerful backspacing
set backspace=          " for the true vi lovers

" now we set some defaults for the editor
set autoindent          " always set autoindenting on
set smartindent         " this is a handy tool for developers
set textwidth=0         " don't wrap words by default
set nobackup            " don't keep a backup file
set viminfo='20,\"50    " read/write a .viminfo file, don't store more than
                        " 50 lines of registers
set history=1024        " keep 1024 lines of command line history
set ruler               " show the cursor position all the time
set visualbell          " enable visualbell
set showcmd             " show (partial) command in status line
set showmatch           " show matching brackets
"set ignorecase          " do case insensitive matching
set incsearch           " incremental search
set autowrite           " save before commands like :next and :make
set hlsearch            " switch on highlighting the last used search pattern
set lazyredraw          " do not update screen while executing macros
set modeline            " read vi set commands
set mouse=a             " enable mouse control

set showmatch           " briefly jump to matching brackets
set showmode            " the mode we're in
"set number              " show line numbers
if v:version >= 700
  set numberwidth=5     " use 5 columns for them
endif

set formatoptions=croqln2   " auto-wrap with textwidth, auto-insert comment
                            " leader, recognize numbered lists, prefer the 2nd
                            " line when auto-indenting

set cinoptions=:0,l1,g0,t0
let g:load_doxygen_syntax=1
set cpoptions=aABceFs

" have command-line completion <Tab> (for filenames, help topics, option
" names) first list the available options and complete the longest common
" part, then have further <Tab>s cycle through the possibilities:
set wildmode=list:longest,full

" ignore some files
set wildignore+=moc_*.cpp,*.o,*.so,*.exe,*.dll,*.class,*.pyc

" set file searching path (^wf, gf)
set path=.,include,../include,../../include,/usr/include,/usr/local/include

" suffixes that get lower priority when doing tab completion for filenames
" these are files we are not likely to want to edit or read
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

if &term =~ "xterm"
  set title             " let the title stuff work
endif

" vim5 comes with syntaxhighlighting. if you want to enable syntax
" hightlighting by default uncomment the next three lines
if has("syntax")
  set background=dark   " rainbows at night
  syntax on             " default to no syntax highlightning
endif

if version >= 600
  filetype on         " enable file type detection
  filetype plugin on  " enable file type plugins
  filetype indent on  " enable file type indents
endif

if has("autocmd")
  " enabled file type detection
  " use the default filetype settings. if you also want to load indent files
  " to automatically do language-dependent indenting add 'indent' as well
  filetype plugin on

  " for all text files set 'textwidth' to 78 characters
  autocmd FileType text setlocal textwidth=78

  " mail bodies have a textwidth of 72 characters, activate numbering
  " formatting, reset comments to default, no indenting
  autocmd FileType mail setlocal tw=72 comments& nocindent

  " HTML files
  autocmd FileType html,css setlocal sw=2

  " this means vim will always jump to the last edited line in a file if
  " possible
  autocmd BufRead *,.* :normal '"

endif

" this is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register
vnoremap p "_dP

" list & listchars
set list listchars=eol:$,tab:>.,trail:.

set fileformats=unix,dos  " Vim's default on UNIX, also use it on DOS

" abbreviations
iab _VERSION <c-r>=strftime("%Y%m%d")<cr>

" ctrl-] fix
map <c-\> <c-]>

nnoremap <a-l> :buffers<cr>:buffer<space>
nnoremap <a-n> :bn<cr>
nnoremap <a-p> :bp<cr>

map <f9> :prev<cr>z.
map <f10> :next<cr>z.

map <f12> :vimgrep /<c-r>// **/*.[ch]*<cr>

" previous and next compiler error (quickfix)
map <c-p> :cprev<cr>z.:cc<cr>
map <c-n> :cnext<cr>z.:cc<cr>

" set 'selection', 'selectmode', 'mousemodel' and 'keymodel' for
" MS Windows
behave xterm

" For CTRL-V to work autoselect must be off.
" On Unix we have two selections, autoselect can be used.
if !has("unix")
  set guioptions-=a
endif

" Alt-Space is System menu
if has("gui")
  noremap <M-Space> :simalt ~<CR>
  inoremap <M-Space> <C-O>:simalt ~<CR>
  cnoremap <M-Space> <C-C>:simalt ~<CR>
  set guifont=courier_new:h9
endif

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
nmap <leader>g :let @/ = '\<<c-r>=expand('<cword>')<cr>\>'<cr>:silent G '\<<c-r>=expand('<cword>')<cr>\>'<cr>:redraw!<cr>:cc<cr>

" search for the current word in C/C++, Python and make files
nmap <leader>v :let @/ = '\<<c-r>=expand('<cword>')<cr>\>'<cr><leader>V
nmap <leader>V :silent vimgrep /<c-r>// **/*.[ch] **/*.[ch]pp **/*.py **/Makefile **/*.java **/*.xml **/*.txt<cr>
"
" ctags ftw
nmap <leader>t :!rm -f tags && find -name '*.[ch]pp' -or -name '*.[ch]' -or -name '*.py' -print0 \| xargs -0 ctags -a<cr>

" persistent undo
set undofile
set undodir=~/.vim/undo

set undolevels=1000
set undoreload=10000

" CtrlP plugin (https://github.com/ctrlpvim/ctrlp.vim):
" git clone https://github.com/ctrlpvim/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<leader>p'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" vim:set ft=vim:
" vi:set et sw=2 tw=78:
