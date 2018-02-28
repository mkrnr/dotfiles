" More information: http://creativecommons.org/licenses/by-sa/3.0/
"
" Authors: Martin Koerner <http://mkoerner.de/> and Onse <http://goo.gl/Qubl8>

" vim config file

set nocompatible

set nofoldenable    " disable folding

set encoding=utf-8

" two spaces instead of tabs
set expandtab
set tabstop=2
set shiftwidth=2
retab

set noshowmode

"set relativenumber number

" automatically change working directory
" (causes problems with citation completion in vim-latexsuite)
" set autochdir
" alternatively:
" autocmd BufEnter * silent! lcd %:p:h

" show linenumbers
set nu


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

map <silent> <DOWN> gj
map <silent> <UP> gk

noremap H ^
noremap L g_
noremap J 5j
noremap K 5k


"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>


"fun! StripTrailingWhitespace()
"    " Don't strip on these filetypes
"    if &ft =~ 'pandoc'
"        return
"    endif
"    %s/\s\+$//e
"endfun

"autocmd BufWritePre * call StripTrailingWhitespace()

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
set clipboard=unnamed

set wildmode=longest,list,full
set wildmenu

" learn it the hard way
"noremap <Left>  <NOP>
"noremap <Right> <NOP>
"noremap <Up>    <NOP>
"noremap <Down>  <NOP>

" move tab
noremap M :tabm<Space>
" open tab
noremap <C-t> :tabedit<Space>

" Enable folding with the spacebar
nnoremap <space> za

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



" settings for vim-markdown plugin
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_math=1
"autocmd BufNewFile,BufRead *.md filetype plugin indent off


" settings for vim-pandoc

let g:pandoc#modules#disabled=["folding"]

" disable default mappings to allow \ll to be specified
let g:pandoc#keyboard#use_default_mappings=0

" fix redraw problem of vim when using silent (from:
" http://vim.wikia.com/wiki/Avoiding_the_"Hit_ENTER_to_continue"_prompts)
command! -nargs=1 Silent
\ | execute ':silent !'.<q-args>
\ | execute ':redraw!'


" insert real tab with shift+tab
noremap <S-Tab> <C-V><Tab>

" used by vim-plug
call plug#begin('~/.local/share/nvim/plugged')
   Plug 'scrooloose/nerdtree'
   Plug 'joshdick/onedark.vim'
call plug#end()


" if &compatible
"   set nocompatible
" endif
" filetype off
" " append to runtime path
" set rtp+=/usr/share/vim/vimfiles
" " initialize dein, plugins are installed to this directory
" call dein#begin(expand('~/.config/nvim/plugged'))
" " add packages here, e.g:
" call dein#add('qwelyt/TrippingRobot')
"   call dein#add('w0rp/ale')
"   call dein#add('Chiel92/vim-autoformat')
"   call dein#add('vim-scripts/indentpython.vim')
"   call dein#add('joshdick/onedark.vim')
"   "call dein#add('nvie/vim-flake8')
"   "call dein#add('Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' })
"   call dein#add('Shougo/deoplete.nvim',{'on_ft': ['python']})
"   call dein#add('Shougo/echodoc.vim')
"   call dein#add('Shougo/neosnippet.vim')
"   call dein#add('zchee/deoplete-jedi')
"   "call dein#add('davidhalter/jedi-vim')
"   call dein#add('scrooloose/nerdtree')
"   call dein#add('jistr/vim-nerdtree-tabs')
"   call dein#add('kien/ctrlp.vim')
"   call dein#add('tpope/vim-fugitive')
"   call dein#add('airblade/vim-gitgutter')
"   call dein#add('Xuyuanp/nerdtree-git-plugin')
"   call dein#add('vim-airline/vim-airline')
"   call dein#add('vim-airline/vim-airline-themes')
"   call dein#add('rakr/vim-one')
"   call dein#add('vim-pandoc/vim-pandoc')
"   call dein#add('vim-pandoc/vim-pandoc-syntax')
"   call dein#add('edkolev/promptline.vim')
"   "call dein#add('tpope/vim-surround')
"   "call dein#add('junegunn/fzf')
" 
"   "call dein#add('ervandew/supertab')
"  "TODO: airblade/vim-rooter
" " exit dein
" call dein#end()
" " auto-install missing packages on startup
" if dein#check_install()
"   call dein#install()
" endif


filetype plugin on


let g:jedi#completions_enabled = 0
"let g:deoplete#enable_at_startup = 1
"call deoplete#custom#set('_', 'converters', ['converter_auto_paren','converter_auto_delimiter'])
"
"let g:deoplete#auto_completion_start_length=1
"let g:deoplete#sources#jedi#server_timeout = 100
"
"let g:deoplete#sources#jedi#python_path = '/usr/bin/python'


"let g:ale_lint_on_text_changed = 'never'
"let g:ale_sign_column_always = 1

let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

let g:airline#extensions#ale#enabled = 1

let g:ale_linters = {
\   'python': ['flake8','pylint'],
\}

"let g:deoplete#enable_at_startup = 1

" stop vim-latex macros
" let g:Imap_FreezeImap=1


let g:SimpylFold_docstring_preview=1

let g:airline_powerline_fonts = 1
let g:airline_theme='onedark'

"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" syntax highlighting
syntax enable


"set background=dark " for the dark version
"colorscheme one
syntax on
colorscheme onedark

"TODO fix this
"autocmd FileType python call deoplete#enable()
"let g:deoplete#enable_at_startup = 1
"autocmd FileType tex :setlocal spell
"au FileType python call deoplete#custom#set('_', 'converters', ['converter_auto_paren','converter_auto_delimiter'])
"

"if !exists('g:deoplete#omni#input_patterns')
"  let g:deoplete#omni#input_patterns = {}
"endif
"" let g:deoplete#disable_auto_complete = 1
"autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
"
"augroup omnifuncs
"  autocmd!
"  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"augroup end



"let g:SuperTabDefaultCompletionType = "<c-n>"
let g:neosnippet#disable_runtime_snippets = { '_' : 1 }



" Python config (TODO: move to proper files)

"au BufNewFile,BufRead *.py
"    \ set tabstop=4
"    \ set softtabstop=4
"    \ set shiftwidth=4
"    \ set textwidth=79
"    \ set expandtab
"    \ set autoindent
"    \ set fileformat=unix
"

"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

""python with virtualenv support
"py << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"  execfile(activate_this, dict(__file__=activate_this))
"EOF



" set tab size for markdown files since 4 spaces are needed in markdown lists
autocmd FileType markdown setlocal shiftwidth=4 tabstop=4

" Remember cursor position between vim sessions
autocmd BufReadPost *
            \ if line("'\"") > 0 && line ("'\"") <= line("$") |
            \   exe "normal! g'\"" |
            \ endif
            " center buffer around cursor when opening files
autocmd BufRead * normal zz

tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

let @t="G:put =strftime('%FT%T%z')A,"
noremap <A-t> @t

