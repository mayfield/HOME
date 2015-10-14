" Vim color file
" @Author: Pascal Vasilii <jabberroid@gmail.com>	
" Hacked on my Mr. Mayfield

hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "mayfield_silent"
"set background=light

if &background == "light"
    hi Cursor           guifg=DarkGrey guibg=grey gui=NONE
    hi LineNr           ctermbg=255 ctermfg=240
    hi StatusLineNC     ctermbg=232  ctermfg=white cterm=bold
    hi StatusLine       ctermfg=black guifg=#DDDDDD guibg=#1D343B gui=italic
    hi SpecialKey       guifg=orange gui=none
    hi Title            guifg=Black   gui=bold cterm=bold
    hi CursorLine       guibg=#fafafa
    hi CursorColumn     guibg=#fafafa
    hi MatchParen       ctermbg=34 guifg=#141312 guibg=Yellow gui=underline
    hi AutoHiGroup      guibg=Yellow 

    hi Directory	    ctermfg=DarkGray gui=bold,italic guifg=DarkGray guibg=#F1FFC1 cterm=bold
    hi FoldColumn       guifg=Black guibg=#F1FFC1 gui=none 
    hi VertSplit        guifg=White guibg=DimGray gui=none 
    hi Wildmenu         guifg=Black guibg=White gui=bold  cterm=bold


    hi Pmenu            guibg=#DDDDDD guifg=Black gui=italic
    hi PmenuSbar        guibg=#DDDDDD guifg=fg gui=italic
    hi PmenuSel         ctermbg=Blue  ctermfg=white  guibg=#F1FFC1 guifg=Black gui=italic
    hi PmenuThumb       ctermfg=white guibg=#DDDDDD guifg=fg gui=none

    hi IncSearch        cterm=reverse
    hi Search           ctermbg=red ctermfg=15

    hi Normal	        ctermfg=234 guifg=#141312 guibg=White 
"    hi Visual	        ctermfg=Blue guibg=#4485FF guifg=white gui=bold cterm=bold
    hi Comment	        ctermfg=29 guifg=#888786	gui=italic
    hi PerlPOD	        ctermfg=Brown guifg=#B86A18	gui=NONE
    hi Constant	        ctermfg=DarkGrey guifg=#141312 gui=bold cterm=bold
    hi Character	    ctermfg=Yellow guifg=#644A9B	gui=NONE
    hi String           ctermfg=DarkRed guifg=#BF0303	gui=italic
    hi Number	        ctermfg=DarkRed  guifg=#B07E00 gui=NONE
    hi Boolean	        ctermfg=DarkBlue guifg=#B07E00	gui=NONE
    hi Special	        ctermfg=DarkRed	guifg=#9C0D0D gui=NONE
    hi Define	        ctermfg=DarkGreen guifg=#006E26 gui=bold cterm=bold

    " vars
    hi Identifier 	    ctermfg=34 guifg=#0057AE gui=NONE
    "hi Exception 	    ctermfg=196 guifg=black gui=bold
    hi Statement 	    ctermfg=26 guifg=#B07E00 gui=NONE
    "hi Label 	        ctermfg=46 guifg=#B07E00 gui=NONE
    hi Keyword 	        ctermfg=DarkBlue guifg=#141312 gui=NONE
    hi PreProc	        ctermfg=DarkBlue guifg=#141312 gui=bold
    hi Type		        ctermfg=34 guifg=black gui=NONE
    hi Function	        ctermfg=160 guifg=#B07E00 gui=NONE
    hi Repeat	        ctermfg=33 guifg=#B07E00 gui=bold
    hi Operator	        ctermfg=33 guifg=#0057AE gui=NONE
    hi Ignore	        ctermfg=DarkBlue guifg=bg
    hi Folded               ctermbg=Grey ctermfg=White guibg=#F1FFC1 guifg=#101010 gui=italic
    "hi Error	        cterm=reverse ctermbg=124 ctermfg=White guibg=#D80000 guifg=#FFD1CC gui=NONE
    hi Error	        ctermbg=124 ctermfg=White
    hi Todo		        cterm=standout ctermbg=Yellow ctermfg=DarkGrey guifg=Grey guibg=#AD5500 gui=NONE
    hi Done		        cterm=standout ctermbg=Gray ctermfg=White guifg=#CCEEFF guibg=Gray gui=NONE

    hi SpellErrors      ctermfg=DarkRed cterm=underline
    "hi SpellBad         ctermbg=202 ctermfg=White

    hi MoreMsg          guifg=black gui=NONE
    hi ModeMsg          guifg=black gui=NONE
    hi Title            gui=bold cterm=bold
    hi NonText          ctermfg=black ctermbg=none guibg=#FFFFFF guifg=black gui=NONE
    hi DiffAdd          ctermfg=white ctermbg=blue guifg=NONE guibg=#CCFFCC gui=NONE
    hi DiffDelete       ctermfg=red guifg=NONE guibg=#FFCCCC gui=NONE
    hi DiffChange       ctermfg=white ctermbg=red guifg=NONE guibg=#F1FFC1 gui=NONE
    hi DiffText         ctermfg=black guibg=#ffffff guifg=NONE gui=NONE

    hi Question         guifg=black gui=bold cterm=bold
    "hi link String	Constant 
    "hi link Character	Constant
    "hi link Number		Constant
    "hi link Boolean	Constant
    "hi link Float		Number
    "hi Conditional	ctermfg=DarkYellow guifg=#B07E00 gui=NONE
    "hi Include		ctermfg=DarkGrey guifg=#141312 gui=bold
    "hi link Structure	Define
    "hi link Macro		PreProc
    "hi link PreCondit	PreProc
    "hi link StorageClass	Type
    "hi link Structure	Type
    "hi link Typedef		Type
    "hi link Tag		Special
    "hi SpecialChar	ctermfg=DarkGreen guifg=#141312 gui=bold
    "hi link Delimiter	Normal
    "hi link SpecialComment 	Special
    "hi link Debug		Special

    hi IndentGuidesOdd ctermbg=250
    hi IndentGuidesEven ctermbg=255
else
    hi LineNr           ctermbg=240 ctermfg=252
    hi StatusLineNC     ctermbg=240 ctermfg=252
    hi StatusLine       ctermbg=240 ctermfg=252
    hi Title            cterm=bold
    hi MatchParen       ctermbg=34

    hi Directory	    ctermfg=DarkGray cterm=bold

    hi PmenuSel         ctermbg=Blue  ctermfg=white
    hi PmenuThumb       ctermfg=white

    hi IncSearch        cterm=reverse
    hi Search           ctermbg=red ctermfg=15

    hi Normal	        ctermfg=252
    hi Comment	        ctermfg=75
    hi PerlPOD	        ctermfg=Brown
    hi Constant	        ctermfg=LightGrey cterm=bold
    hi Character	    ctermfg=Yellow
    hi String           ctermfg=white
    hi Number	        ctermfg=202
    hi Boolean	        ctermfg=DarkBlue
    hi Special	        ctermfg=yellow
    hi Define	        ctermfg=DarkGreen cterm=bold

    " vars
    hi Identifier 	    ctermfg=36
    "hi Exception 	    ctermfg=196
    hi Statement 	    ctermfg=33
    hi ClassStatement   ctermfg=white cterm=bold
    hi Class            ctermfg=230
    hi FunctionStatement ctermfg=white cterm=bold
    hi Function	        ctermfg=230
    hi Label 	        ctermfg=yellow
    hi Keyword 	        ctermfg=yellow
    hi PreProc	        ctermfg=yellow
    hi Type		        ctermfg=yellow
    hi Repeat	        ctermfg=33
    hi Operator	        ctermfg=33
    hi Ignore	        ctermfg=DarkBlue
    hi Error	        ctermbg=88 ctermfg=White
    hi Todo		        cterm=standout ctermbg=Yellow ctermfg=DarkGrey
    hi Done		        cterm=standout ctermbg=Gray ctermfg=White

    hi SpellErrors      ctermbg=DarkRed ctermfg=White term=underline
    hi SpellBad         ctermbg=DarkRed ctermfg=White term=underline

    hi Title            cterm=bold

" Python specific
    hi pythonSelfIdentifier ctermfg=210

    hi IndentGuidesOdd ctermbg=250
    hi IndentGuidesEven ctermbg=255
endif
