" additional command for markdown files

"nunmap \ll
"map \ll :Silent pandoc %:t -o %:t:r.pdf

nmap <silent> <localleader>ll :Silent pandoc %:t -o %:t:r.pdf<CR>
nmap <silent> <localleader>lv :Silent o %:t:r.pdf<CR>
