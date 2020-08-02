" All Mappings

" Remap leader
let mapleader = ","

imap jk <Esc>

" NERDTree
map <Leader>n :NERDTreeToggle<cr>
map <Leader>c :NERDTreeFind<cr>

" Generate ctags
map ]gt :call atags#generate()<cr>

" FZF
map <Leader>f :FZF<cr>
map <Leader>t :Tags<cr>
map <Leader>b :Buffers<cr>

" Buffers and tabs
map ]b :bn<cr>
map [b :bp<cr>
map gb :bn<cr>
map bd :bd<cr>

map ]t :tabnext<cr>
map [t :tabprevious<cr>

" Annotate
map ]a :Gblame<cr>

" Lnext/Lprev
map ]l :lnext<cr>
map [l :lprev<cr>

" Term esc
tnoremap <Esc> <C-\><C-n>

" Review the current branch to master
map ]r :DiffRev master<cr>

" Open tagbar
nmap <Leader>t :TagbarToggle<cr>

" coc mappings
nmap gd <Plug>(coc-definition)
let g:go_def_mapping_enabled = 0 " disable the same mapping for vim-go
nmap gy <Plug>(coc-type-definition)
nmap gi <Plug>(coc-implementation)
nmap gr <Plug>(coc-references)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList services<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

inoremap <silent><expr> <c-space> coc#refresh()

command! -nargs=0 Format :call CocAction('format')

" copy current file name and line number to register
nmap <silent>cp :let @+ = printf('%s:%s', expand("%"), line("."))<cr>

" signature while editing (disabled, go-langserver uses too much memory with
" this enabled)
"autocmd CursorHold,CursorMoved,CursorHoldI,CursorMovedI * call CocAction('showSignatureHelp')
