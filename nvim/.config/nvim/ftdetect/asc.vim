au! BufNewFile,BufRead *.asc setf asciidoc

function! s:AdocPreview()
  call system("asciidoc -o /tmp/" . expand("%:r") . ".html " . expand('%:p') . "; firefox /tmp/" . expand('%:r') . ".html")
endfunction

command! -nargs=* AdocPreview call s:AdocPreview()
