" More information: http://creativecommons.org/licenses/by-sa/3.0/
"
" Authors: Martin Koerner <http://mkoerner.de/> and Onse <http://goo.gl/Qubl8>

" vim config file

" two spaces instead of tabs
set expandtab
set tabstop=2
set shiftwidth=2
retab

" automatically change workinf directory
" (causes problems with citation completion in vim-latexsuite)
" set autochdir
" alternatively:
" autocmd BufEnter * silent! lcd %:p:h

" show linenumbers
set nu

" syntax highlighting
syntax enable

" for autocompletion
set ignorecase
set infercase


" Octave syntax
"augroup filetypedetect
"  au! BufRead,BufNewFile *.m,*.oct set filetype=octave
"augroup END

" highlighted search
set nohlsearch

" enable mouse
set mouse=a

" incremental search
set incsearch

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Show matching [] and {}
set showmatch

" Set automatic indentation
set autoindent
set smartindent

" disable automatic indentation with F8
nnoremap <F8> :setl noai nocin nosi inde=<CR>
" set spellcheck for ... with F10
nnoremap <F10> :setlocal spell spelllang=

" Set title of window to file name
set title
" and reset title to cwd on exit via xterm
let &titleold=getcwd()
" CTRL+W for sudo save
command! W w !sudo tee % > /dev/null

" Navigate through visible lines, not logical ones
" imap <silent> j <C-o>gj
" imap <silent> k <C-o>gk
noremap <silent> j gj
noremap <silent> k gk

" LaTeX REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*
" OPTIONAL: This enables automatic indentation as you type.
" TODO: enable indent when problem with markdown indentation (list items get indented too much) is solved
" filetype indent on
" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
let g:Tex_CompileRule_dvi = 'latex -interaction=nonstopmode -file-line-error-style $*'
let g:Tex_CompileRule_pdf = 'pdflatex -interaction=nonstopmode -file-line-error-style $*'
let g:Tex_ViewRule_pdf = 'zathura -l error'
let g:Tex_ViewRule_ps = 'zathura -l error'

" silent compiling of latex documents
 nmap <Leader>lv :silent call Tex_RunLaTeX()<CR>

" stop vim-latex macros
" let g:Imap_FreezeImap=1


" move through windows with ALT and arrows
noremap <silent> <A-Down> :wincmd h<CR>
noremap <silent> <A-Up> :wincmd j<CR>
noremap <silent> <A-Left> :wincmd k<CR>
noremap <silent> <A-Right> :wincmd l<CR>


" stack windows with CTRL and j / k
map <A-J> <C-W>j<C-W>_
map <A-K> <C-W>k<C-W>_

" set window height to zero
set wmh=0

" quickly resize windows with a vertical split
map - <C-W>-
map + <C-W>+

" resize vertical windows quickly with ALT-SHIFT-[<>]
map <M-<> <C-W><
map <M->> <C-W>>

let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_MultipleCompileFormats='dvi,ps,pdf'
set clipboard=unnamedplus

set wildmode=longest,list,full
set wildmenu

" learn it the hard way
noremap <Left>  <NOP>
noremap <Right> <NOP>
noremap <Up>    <NOP>
noremap <Down>  <NOP>

" move tab
noremap M :tabm<Space>
" open tab
noremap <C-t> :tabedit<Space>


" source $MYVIMRC reloads the saved $MYVIMRC
nmap <Leader>s :source $MYVIMRC<CR>

" opens $MYVIMRC for editing, or use :tabedit $MYVIMRC
nmap <Leader>c :tabedit $MYVIMRC<CR>

" change directory for .swap files
set directory=~/.vim/tmp//,.,/var/tmp//,/tmp//

" persistent undo
set undodir=~/.vim/undodir
set undofile
" maximum number of changes that can be undone
set undolevels=1000
" maximum number lines to save for undo on a buffer reload
set undoreload=10000

" allow cursor to be placed in void text
set virtualedit=block

" restore cursor position for all files (*):
" au BufWinLeave * mkview
" au BufWinEnter * silent loadview

" enable solarized theme
set background=dark
colorscheme solarized

" set tab size for markdown files since 4 spaces are needed in markdown lists
autocmd FileType markdown setlocal shiftwidth=4 tabstop=4

" settings for vim-markdown plugin
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_math=1


" settings for vim-pandoc

let g:pandoc#modules#disabled=["folding"]

" disable default mappings to allow \ll to be specified
let g:pandoc#keyboard#use_default_mappings=0


" fix redraw problem of vim when using silent (from:
" http://vim.wikia.com/wiki/Avoiding_the_"Hit_ENTER_to_continue"_prompts)
command! -nargs=1 Silent
\ | execute ':silent !'.<q-args>
\ | execute ':redraw!'


