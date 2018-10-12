" default configuration {{{1
if !exists('g:ex_symbol_winsize')
    let g:ex_symbol_winsize = 30
endif

if !exists('g:ex_symbol_winsize_zoom')
    let g:ex_symbol_winsize_zoom = 60
endif

" bottom or top
if !exists('g:ex_symbol_winpos')
    let g:ex_symbol_winpos = 'right'
endif

if !exists('g:ex_symbol_enable_help')
    let g:ex_symbol_enable_help = 1
endif

if !exists('g:ex_symbol_select_cmd')
    let g:ex_symbol_select_cmd = 'ts'
endif

"}}}

" commands {{{1
command! -n=1 -complete=customlist,ex#compl_by_symbol SList call exsymbol#list('<args>')
command! EXSymbolCWord call exsymbol#list(expand('<cword>'))

command! EXSymbolToggle call exsymbol#toggle_window()
command! EXSymbolOpen call exsymbol#open_window()
command! EXSymbolClose call exsymbol#close_window()
command! EXSymbolList call exsymbol#list_all()
"}}}

" default key mappings {{{1
call exsymbol#register_hotkey( 1 , 1, '?'            , ":call exsymbol#toggle_help()<CR>"           , 'Toggle help.' )
if has('gui_running')
    call exsymbol#register_hotkey( 2 , 1, '<ESC>'           , ":EXSymbolClose<CR>"                         , 'Close window.' )
else
    call exsymbol#register_hotkey( 2 , 1, '<leader><ESC>'   , ":EXSymbolClose<CR>"                         , 'Close window.' )
endif
" call exsymbol#register_hotkey( 3 , 1, '<Space>'         , ":call exsymbol#toggle_zoom()<CR>"           , 'Zoom in/out project window.' )
call exsymbol#register_hotkey( 3 , 1, 'z'               , ":call exsymbol#toggle_zoom()<CR>"           , 'Zoom in/out project window.' )
call exsymbol#register_hotkey( 4 , 1, '<CR>'            , ":call exsymbol#confirm_select()<CR>"        , 'Go to the symbol define.' )
call exsymbol#register_hotkey( 5 , 1, '<2-LeftMouse>'   , ":call exsymbol#confirm_select()<CR>"        , 'Go to the symbol define.' )
call exsymbol#register_hotkey( 8 , 1, '<leader>r'       , ":exec 'Filter ' . @/<CR>"                   , 'Filter search result.' )
call exsymbol#register_hotkey( 9 , 1, '<leader>d'       , ":exec 'ReverseFilter ' . @/<CR>"            , 'Reverse filter search result.' )
call exsymbol#register_hotkey( 100, 0, '<leader>ss', ":EXSymbolList<CR>", 'List all symbols.' )
call exsymbol#register_hotkey( 101, 0, '<leader>sq', ":EXSymbolOpen<CR>", 'Open symbols window.' )
call exsymbol#register_hotkey( 102, 0, '<leader>sg', ":EXSymbolCWord<CR>", 'List symbols contains current word.' )

if has('gui_running')
    if has ('mac')
        call exsymbol#register_hotkey( 102, 0, 'Ò', ":EXSymbolList<CR>:redraw<CR>/", 'List all symbols and stay in search mode.' )
    else
        call exsymbol#register_hotkey( 102, 0, '<M-L>', ":EXSymbolList<CR>:redraw<CR>/", 'List all symbols and stay in search mode.' )
    endif
endif
"}}}

call ex#register_plugin( 'exsymbol', { 'actions': ['autoclose'] } )

" vim:ts=4:sw=4:sts=4 et fdm=marker:
