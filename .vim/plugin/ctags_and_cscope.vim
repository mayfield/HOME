" Small plugin to enable Ctags and Cscope in Vim, along with some associated
" key mappings
" Allow use of both Ctags and Cscope for CTRL-], etc...
"
set cscopetag
" Allow relative path lookups to work properly when we are above the DB
set cscoperelative

" Search Ctags before resorting to Cscope
set csto=1

function CScopeSetup()
    " add any cscope databases we find; Starting in cwd and going up.
    if $CSCOPE_DB != ""
        let csdb_filename = $CSCOPE_DB
    else
        let csdb_filename = 'cscope.out'
    endif
    " kill the automatic csto first.. then we'll search up the folder tree
    :silent cs kill -1

    for csdb in findfile(csdb_filename, getcwd().';'.expand("$HOME"), -1)
        exe ":silent cs add ".csdb
    endfor

   "for csdb in findfile(csdb_filename, expand('%:p:h').';'.expand("$HOME"), -1)
   "    exe ":silent cs add ".csdb
   "endfor
endfunction

autocmd BufEnter * call CScopeSetup()

" Search current directory for the Ctags file
if filereadable("tags")
   set tags=tags
" Else add the tags pointed to by environment variable CTAGS_FILE
elseif $CTAGS_FILE != ""
   set tags=$CTAGS_FILE
endif

" Enable verbose Cscope from now on, so we get feedback if we manually add
" a new database
set cscopeverbose

" Additional key mapping for Cscope
"
" The following maps all invoke one of the following cscope search types:
"
"   's'   symbol: find all references to the token under cursor
"   'g'   global: find global definition(s) of the token under cursor
"   'c'   calls:  find all calls to the function name under cursor
"   't'   text:   find all instances of the text under cursor
"   'e'   egrep:  egrep search for the word under cursor
"   'f'   file:   open the filename under cursor
"   'i'   includes: find files that include the filename under cursor
"   'd'   called: find functions that function under cursor calls
"
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
