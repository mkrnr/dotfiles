setlocal foldlevel=999


" set spelling to en_us by default
setlocal spell spelllang=en_us

nmap <silent> <localleader>kd :Silent latexmk -pdf -cd %:t <CR>
nmap <silent> <localleader>km :call LatexmkOnLatexmain()<CR>

function! LatexmkOnLatexmain()
  let latexmainFile=system('ls *.latexmain | tr "\n" " "')
  if !empty(matchstr(latexmainFile, '.*no matches found.*'))
    " no matching .latexmain found
    echo "test"
    let currentdir=fnamemodify(getcwd(), ':t')
    " look in parent directory
    " TODO: search recusively thorugh parents?
    execute 'cd .. '
    let latexmainFile=system('ls *.latexmain | tr "\n" " "')
    echo latexmainFile
    let mainFile=system("basename ".latexmainFile." .latexmain")
    let execstr=':Silent latexmk -pdf -cd '.mainFile
    execute execstr
    execute 'cd '.currentdir
  else
    " matching .latexmain found
    let mainFile=system("basename ".latexmainFile." .latexmain")
    let execstr=':Silent latexmk -pdf -cd '.mainFile
    execute execstr
  endif

endfunction

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
let theuniqueserv = expand("%:t:r")

" run vim appropriately
let g:Tex_ViewRuleComplete_pdf = 'zathura -x "vim --servername '.theuniqueserv.' --remote +\%{line} \%{input}" $*.pdf 2>/dev/null &'


" Forward search
" syntax for zathura: zathura --synctex-forward 193:1:paper.tex paper.pdf
function! SyncTexForward()
        let execstr = 'silent! !zathura --synctex-forward '.line('.').':1:"'.expand('%').'" "'.expand("%:p:r").'".pdf'
        execute execstr
endfunction

" k=kompile (or kompilieren in German...)
"nmap \k \ll

"nmap \v \lv

" TODO: make this work
nmap \f :call SyncTexForward()<CR>

