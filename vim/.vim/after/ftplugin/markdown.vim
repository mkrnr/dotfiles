" additional command for markdown files

"nunmap \ll
"map \ll :Silent pandoc %:t -o %:t:r.pdf

nmap <silent> <localleader>ll :Silent pandoc %:t -o %:t:r.pdf<CR>
nmap <silent> <localleader>lv :Silent o %:t:r.pdf<CR>


" TODO: check what this folding code exactly does
" folding for Markdown headers, both styles (atx- and setex-)
" http://daringfireball.net/projects/markdown/syntax#header
"
" original version from Steve Losh's gist: https://gist.github.com/1038710

func! Foldexpr_markdown(lnum)
    if (a:lnum == 1)
        let l0 = ''
    else
        let l0 = getline(a:lnum-1)
    endif

    let l1 = getline(a:lnum)

    let l2 = getline(a:lnum+1)

    if  l2 =~ '^==\+\s*'
        " next line is underlined (level 1)
        return '>1'
    elseif l2 =~ '^--\+\s*'
        " next line is underlined (level 2)
        return '>2'
    elseif l1 =~ '^#'
        " don't include the section title in the fold
        return '-1'
    elseif l0 =~ '^#'
        " current line starts with hashes
        return '>'.matchend(l0, '^#\+')
    else
        " keep previous foldlevel
        return '='
    endif
endfunc


if !get(g:, "vim_markdown_folding_disabled", 0)
  setlocal foldexpr=Foldexpr_markdown(v:lnum)
  setlocal foldmethod=expr
endif


