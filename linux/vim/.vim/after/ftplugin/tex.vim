setlocal foldlevel=999


" set spelling to en_us by default
setlocal spell spelllang=en_us



" partly from: http://debdeep777.blogspot.de/2015/01/vim-texlive-vim-latex-suite-zathura-pdf.html
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

function! LatexmkOnLatexmain()
  let latexmainFile=system('ls *.latexmain | tr "\n" " "')
  if !empty(matchstr(latexmainFile, '.*no matches found.*'))
    " no matching .latexmain found
    let currentdir=fnamemodify(getcwd(), ':t')
    " look in parent directory
    " TODO: search recusively thorugh parents?
    execute 'cd .. '
    let latexmainFile=system('ls *.latexmain | tr "\n" " "')
    let mainFile=system("basename ".latexmainFile." .latexmain")
    let execstr=":Silent latexmk -pdflatex='pdflatex -file-line-error -synctex=1' -pdf ".mainFile
    execute execstr
    execute 'cd '.currentdir
  else
    " matching .latexmain found
    let mainFile=system("basename ".latexmainFile." .latexmain")
    let execstr=":Silent latexmk -pdflatex='pdflatex -file-line-error -synctex=1' -pdf ".mainFile
    execute execstr
  endif
endfunction

function! RunZathura()
  let theuniqueserv = expand("%:t:r")
  let folders=expand("%:h")
  if !empty(matchstr(folders, '\.'))
    " no extra folders
    execute "normal \\lv"
  else
    execute "cd ".folders
    execute system('zathura -x "vim --servername '.theuniqueserv.' --remote +\%{line} \%{input}" ../main.pdf 2>/dev/null &')

    let returnDirs=system('echo '.folders.' | sed "s#[A-Za-z]*#..#g"')

    execute "cd ".returnDirs
  endif
  echo theuniqueserv
  "execute execstr
endfunction

" Forward search
" syntax for zathura: zathura --synctex-forward 193:1:paper.tex paper.pdf
function! SyncTexForward()
  let latexmainFile=system('ls *.latexmain')
  let latexmainFile=substitute(latexmainFile, "\n", "" ,"")
  if !empty(matchstr(latexmainFile, '.*no matches found.*'))
    " no matching .latexmain found
    let currentdir=fnamemodify(getcwd(), ':t')
    " look in parent directory
    " TODO: search recusively thorugh parents?
    execute 'cd .. '
    let latexmainFile=system('ls *.latexmain')
    let latexmainFile=substitute(latexmainFile, "\n", "" ,"")
    let mainFile=substitute(latexmainFile, ".latexmain", "" ,"")

    let mainFileName=substitute(mainFile, ".tex", "" ,"")

    let execstr = ':Silent zathura --synctex-forward '.line('.').':1:'.expand('%').' '.expand("%:p:h:h").'/'.mainFileName.'.pdf'
    execute 'cd '.currentdir
  else
    " matching .latexmain found
    let mainFile=substitute(latexmainFile, ".latexmain", "" ,"")

    let mainFileName=substitute(mainFile, ".tex", "" ,"")

    let execstr = ':Silent zathura --synctex-forward '.line('.').':1:'.expand('%').' '.expand("%:p:h:h").'/'.mainFileName.'.pdf'
  endif
  execute execstr
endfunction

" k=kompile (or kompilieren in German...)
nmap <silent> <localleader>k :call LatexmkOnLatexmain()<CR>

nmap <localleader>v :call RunZathura()<CR>

nmap <localleader>f :call SyncTexForward()<CR>
