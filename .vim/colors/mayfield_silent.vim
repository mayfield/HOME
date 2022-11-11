" Vim color file
" @Author: Pascal Vasilii <jabberroid@gmail.com>
" Hacked on my Mr. Mayfield

hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "mayfield_silent"

hi CursorLine       cterm=reverse

" gitgutter
hi clear SignColumn
hi link SignColumn LineNr
hi link DiffAdd LineNr
hi link DiffChange LineNr
hi link DiffDelete LineNr
hi link GitGutterAddDefault LineNr
hi link GitGutterChangeDefault LineNr
hi link GitGutterChangeDefault LineNr
hi link GitGutterDeleteDefault LineNr


if &background == "light"
    hi LineNr           ctermbg=255 ctermfg=250
    hi StatusLineNC     ctermbg=232  ctermfg=white cterm=bold
    hi StatusLine       ctermfg=black
    hi MatchParen       ctermbg=34
    hi AutoHiGroup      ctermbg=Yellow

    hi Directory        ctermfg=DarkGray cterm=bold

    hi PmenuSel         ctermbg=Blue  ctermfg=white
    hi PmenuThumb       ctermfg=white

    hi IncSearch        cterm=reverse
    hi Search           ctermbg=red ctermfg=15

    hi Normal           ctermfg=238
"    hi Visual           ctermfg=Blue cterm=bold
    hi Comment          ctermfg=172
    hi PerlPOD          ctermfg=Brown
    hi Constant         ctermfg=DarkGrey cterm=bold
    hi Character        ctermfg=Yellow
    hi String           ctermfg=28
    hi Number           ctermfg=26
    hi Boolean          ctermfg=236 cterm=bold
    hi Null             ctermfg=240 cterm=bold
    hi Special          ctermfg=DarkRed
    hi Define           ctermfg=red cterm=bold

    " vars
    hi Identifier       ctermfg=232
    "hi Exception        ctermfg=196
    hi Statement        ctermfg=26
    hi FunctionInterrupt ctermfg=160
    "hi Label            ctermfg=46
    hi Keyword          ctermfg=DarkBlue
    hi PreProc          ctermfg=DarkBlue
    hi Type             ctermfg=34
    hi SubType          ctermfg=59
    hi ClassStatement   ctermfg=red cterm=bold
    hi Class            ctermfg=38 cterm=bold
    hi FunctionStatement ctermfg=196
    hi Function         ctermfg=26
    hi Repeat           ctermfg=202
    hi Operator         ctermfg=202
    hi Ignore           ctermfg=DarkBlue
    hi Folded           ctermbg=Grey ctermfg=White
    "hi Error            cterm=reverse ctermbg=124 ctermfg=White
    hi Error            ctermbg=124 ctermfg=White
    hi ErrorMsg         ctermbg=124 ctermfg=White
    hi Todo             cterm=standout ctermbg=Yellow ctermfg=DarkGrey
    hi Done             cterm=standout ctermbg=Gray ctermfg=White

    hi SpellErrors      ctermfg=DarkRed ctermbg=none cterm=underline,bold
    hi SpellBad         ctermfg=DarkRed ctermbg=none cterm=underline,bold

    hi AsyncStatement ctermfg=77 cterm=bold
    hi AwaitStatement ctermfg=208 cterm=bold
    hi SelfIdent ctermfg=88
    hi pythonDecoratorName ctermfg=28
    hi pythonDecoratorDot ctermfg=232
    hi Question         cterm=bold
    hi WarningMsg       ctermbg=124 ctermfg=White
else
    hi LineNr           ctermbg=234 ctermfg=240
    hi StatusLine       ctermbg=248 ctermfg=236
    hi MatchParen       ctermbg=34

    hi Directory        ctermfg=DarkGray cterm=bold

    hi PmenuSel         ctermbg=Blue  ctermfg=white
    hi PmenuThumb       ctermfg=white

    hi IncSearch        cterm=reverse
    hi Search           ctermbg=red ctermfg=15

    hi Normal           ctermfg=250
    hi Comment          ctermfg=256
    hi PerlPOD          ctermfg=Brown
    hi Constant         ctermfg=LightGrey cterm=bold
    hi Character        ctermfg=Yellow
    hi String           ctermfg=240
    hi Number           ctermfg=40
    hi Boolean          ctermfg=254 cterm=bold
    hi Null             ctermfg=236 cterm=bold
    hi Special          ctermfg=186
    hi Define           ctermfg=red cterm=bold

    " vars
    hi Identifier       ctermfg=255
    "hi Exception        ctermfg=196
    hi Statement        ctermfg=33
    hi FunctionInterrupt ctermfg=178
    hi ClassStatement   ctermfg=red cterm=bold
    hi Class            ctermfg=38 cterm=bold
    hi FunctionStatement ctermfg=160
    hi Function         ctermfg=25
    hi Label            ctermfg=yellow
    hi Keyword          ctermfg=yellow
    hi PreProc          ctermfg=yellow
    hi Type             ctermfg=white cterm=bold
    hi SubType          ctermfg=59
    hi Repeat           ctermfg=202
    hi Operator         ctermfg=202
    hi Ignore           ctermfg=DarkBlue
    hi Error            ctermbg=88 ctermfg=White
    hi ErrorMsg         ctermbg=88 ctermfg=White
    hi Todo             cterm=standout ctermbg=Yellow ctermfg=DarkGrey
    hi Done             cterm=standout ctermbg=Gray ctermfg=White

    hi SpellErrors      ctermbg=DarkRed ctermfg=White
    hi SpellBad         ctermbg=DarkRed ctermfg=White

    hi AsyncStatement ctermfg=77 cterm=bold
    hi AwaitStatement ctermfg=208 cterm=bold
    hi SelfIdent ctermfg=124
endif
