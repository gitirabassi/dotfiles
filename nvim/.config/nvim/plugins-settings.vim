" Plugins specific configurations

" Multi Cursor
let g:multi_cursor_exit_from_visual_mode=0
let g:multi_cursor_exit_from_insert_mode=0

" atags default command
let g:atags_build_commands_list = ["ctags -o tags -R --c++-kinds=+p --fields=+iaS --sort=yes /usr/include `pwd`"]

let g:tagbar_autofocus = 1

" NERDTree
let g:NERDTreeShowHidden=1
if exists("NERDTreeAddKeyMap")
  call NERDTreeAddKeyMap({
          \ 'key': 'yy',
          \ 'callback': 'NERDTreeYankCurrentNode',
          \ 'quickhelpText': 'put full path of current node into the default register' })
endif
au FileType nerdtree set nolist

" NERDTree git
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }
let g:NERDTreeHighlightCursorline=0

