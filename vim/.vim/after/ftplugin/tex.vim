setlocal foldlevel=999

" from: http://debdeep777.blogspot.de/2015/01/vim-texlive-vim-latex-suite-zathura-pdf.html
"
" Default compiling format
let g:Tex_DefaultTargetFormat='pdf'

" set the default viewer
let g:Tex_ViewRule_pdf = 'zathura'

" Trying to add same for pdfs, hoping that package SynTex is installed
let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 -interaction=nonstopmode $*'

" Get the correct servername, which should be the filename of the tex file,
" without the extension.
" Using the filename, without the extension, not in uppercase though, but
" that's okay for a servername, it automatically get uppercased
let theuniqueserv = expand("%:r")

" run vim appropriately
let g:Tex_ViewRuleComplete_pdf = 'zathura -x "vim --servername '.theuniqueserv.' --remote +\%{line} \%{input}" $*.pdf 2>/dev/null &'


" Forward search
" syntax for zathura: zathura --synctex-forward 193:1:paper.tex paper.pdf
function! SyncTexForward()
        let execstr = 'silent! !zathura --synctex-forward '.line('.').':1:"'.expand('%').'" "'.expand("%:p:r").'".pdf'
        execute execstr
endfunction

" k=kompile (or kompilieren in German...)
nmap \k \ll

nmap \v \lv

" TODO: make this work
" nmap \f :call SyncTexForward()

