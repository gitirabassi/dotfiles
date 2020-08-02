" My personal colorscheme
" You're welcome to use it :]
set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "fntlnz"

hi Normal       ctermfg=254
hi NonText      ctermfg=254
hi comment      ctermfg=darkgray
hi constant     ctermfg=254
hi string       ctermfg=darkgray
hi identifier   ctermfg=254
hi statement    ctermfg=254 cterm=bold
hi define       cterm=bold
hi preproc      ctermfg=254
hi type         ctermfg=254 cterm=bold
hi special      ctermfg=254 ctermfg=254
hi Underlined   ctermfg=254 cterm=underline
hi label        ctermfg=254
hi operator     ctermfg=254
hi delimiter    ctermfg=darkgray cterm=NONE

hi SpellBad     ctermbg=124
hi ErrorMsg     ctermfg=254
hi WarningMsg   ctermfg=254 cterm=bold
hi ModeMsg      ctermfg=254
hi MoreMsg      ctermfg=254
hi Error        ctermfg=254

hi Todo         ctermfg=black ctermfg=black
hi Cursor       ctermfg=254 ctermfg=254
hi Search       ctermfg=black ctermfg=black cterm=NONE
hi IncSearch    ctermfg=green ctermfg=green cterm=NONE
hi LineNr       ctermfg=254
hi title        cterm=bold

hi StatusLine    cterm=none ctermfg=white ctermbg=black
hi StatusLineNC  cterm=none ctermfg=fg    ctermbg=white
hi VertSplit     ctermfg=254 ctermfg=254

hi Visual        term=reverse  ctermfg=254 ctermfg=254

hi DiffChange    ctermbg=130 ctermfg=254 ctermfg=254
hi DiffText      ctermbg=89 ctermfg=254 ctermfg=254
hi DiffAdd       ctermbg=22 ctermfg=254  ctermfg=254
hi DiffDelete    ctermbg=88 ctermfg=254  ctermfg=254

hi Folded        ctermfg=254
hi FoldColumn    ctermfg=254  ctermfg=254
hi cIf0          ctermfg=254

hi Pmenu ctermbg=234 ctermfg=white
hi VertSplit cterm=none

highlight ExtraWhitespace ctermbg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

