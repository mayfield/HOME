" Vim color file
" @Author: Pascal Vasilii <jabberroid@gmail.com>
" Hacked on my Mr. Mayfield

hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "mayfield_silent"

if &background == "light"
    hi LineNr           ctermbg=255 ctermfg=240
    hi StatusLineNC     ctermbg=232  ctermfg=white cterm=bold
    hi StatusLine       ctermfg=black
    hi Title            cterm=bold
    hi CursorLine       ctermbg=black
    hi MatchParen       ctermbg=34
    hi AutoHiGroup      ctermbg=Yellow

    hi Directory        ctermfg=DarkGray cterm=bold

    hi PmenuSel         ctermbg=Blue  ctermfg=white
    hi PmenuThumb       ctermfg=white

    hi IncSearch        cterm=reverse
    hi Search           ctermbg=red ctermfg=15

    hi Normal           ctermfg=234
"    hi Visual           ctermfg=Blue cterm=bold
    hi Comment          ctermfg=240
    hi PerlPOD          ctermfg=Brown
    hi Constant         ctermfg=DarkGrey cterm=bold
    hi Character        ctermfg=Yellow
    hi String           ctermfg=18
    hi Number           ctermfg=DarkRed
    hi Boolean          ctermfg=236 cterm=bold
    hi Null             ctermfg=124 cterm=bold
    hi Special          ctermfg=DarkRed
    hi Define           ctermfg=red cterm=bold

    " vars
    hi Identifier       ctermfg=34
    "hi Exception        ctermfg=196
    hi Statement        ctermfg=26
    "hi Label            ctermfg=46
    hi Keyword          ctermfg=DarkBlue
    hi PreProc          ctermfg=DarkBlue
    hi Type             ctermfg=34
    hi ClassStatement   ctermfg=red cterm=bold
    hi Class            ctermfg=38 cterm=bold
    hi FunctionStatement ctermfg=160
    hi Function         ctermfg=26
    hi Repeat           ctermfg=202
    hi Operator         ctermfg=202
    hi Ignore           ctermfg=DarkBlue
    hi Folded           ctermbg=Grey ctermfg=White
    "hi Error            cterm=reverse ctermbg=124 ctermfg=White
    hi Error            ctermbg=124 ctermfg=White
    hi Todo             cterm=standout ctermbg=Yellow ctermfg=DarkGrey
    hi Done             cterm=standout ctermbg=Gray ctermfg=White

    hi SpellErrors      ctermfg=DarkRed
    hi SpellBad         ctermfg=DarkRed

    hi Title            cterm=bold

    hi pythonSelfIdentifier ctermfg=88
    hi pythonDecoratorName ctermfg=28
    hi pythonDecoratorDot ctermfg=232
    hi Question         cterm=bold

    hi IndentGuidesOdd  ctermbg=250
    hi IndentGuidesEven ctermbg=255
else
    hi LineNr           ctermbg=240 ctermfg=252
    hi StatusLineNC     ctermbg=240 ctermfg=252
    hi StatusLine       ctermbg=240 ctermfg=252
    hi Title            cterm=bold
    hi MatchParen       ctermbg=34

    hi Directory        ctermfg=DarkGray cterm=bold

    hi PmenuSel         ctermbg=Blue  ctermfg=white
    hi PmenuThumb       ctermfg=white

    hi IncSearch        cterm=reverse
    hi Search           ctermbg=red ctermfg=15

    hi Normal           ctermfg=252
    hi Comment          ctermfg=249
    hi PerlPOD          ctermfg=Brown
    hi Constant         ctermfg=LightGrey cterm=bold
    hi Character        ctermfg=Yellow
    hi String           ctermfg=white
    hi Number           ctermfg=202
    hi Boolean          ctermfg=DarkBlue
    hi Special          ctermfg=yellow
    hi Define           ctermfg=DarkGreen

    " vars
    hi Identifier       ctermfg=36
    "hi Exception        ctermfg=196
    hi Statement        ctermfg=33
    hi ClassStatement   ctermfg=white cterm=bold
    hi Class            ctermfg=230
    hi FunctionStatement ctermfg=white cterm=bold
    hi Function         ctermfg=230
    hi Label            ctermfg=yellow
    hi Keyword          ctermfg=yellow
    hi PreProc          ctermfg=yellow
    hi Type             ctermfg=yellow
    hi Repeat           ctermfg=33
    hi Operator         ctermfg=33
    hi Ignore           ctermfg=DarkBlue
    hi Error            ctermbg=88 ctermfg=White
    hi Todo             cterm=standout ctermbg=Yellow ctermfg=DarkGrey
    hi Done             cterm=standout ctermbg=Gray ctermfg=White

    hi SpellErrors      ctermbg=DarkRed ctermfg=White
    hi SpellBad         ctermbg=DarkRed ctermfg=White

    hi Title            cterm=bold

    hi pythonSelfIdentifier ctermfg=210

    hi IndentGuidesOdd ctermbg=250
    hi IndentGuidesEven ctermbg=255
endif
