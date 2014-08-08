"
" A Vim colorscheme by Giovanni Cavallanti.
"
" Available at http://github.com/gcavn/trafficlights/
"
" }}}

" Supporting code -------------------------------------------------------------
" Preamble {{{

if !has("gui_running") && &t_Co != 88 && &t_Co != 256
    finish
endif

" set background=dark

if exists("syntax_on")
    syntax reset
endif

let colors_name = "trafficlights"

if !exists("g:trafficlights_html_link_underline") " {{{
    let g:trafficlights_html_link_underline = 1
endif " }}}

if !exists("g:trafficlights_css_props_highlight") " {{{
    let g:trafficlights_css_props_highlight = 0
endif " }}}

" }}}

" Palette {{{
let s:bwc = {}
let s:bwc.nocol    = ['66ffff', 'none']
if &background == 'dark'

    let s:bwc.gray24  = ['ffffff', 231]
    let s:bwc.gray23  = ['eeeeee', 255]
    let s:bwc.gray20  = ['d0d0d0', 252]
    let s:bwc.gray18  = ['bcbcbc', 250]
    let s:bwc.gray13  = ['8a8a8a', 245]
    let s:bwc.gray11  = ['767676', 243]
    let s:bwc.gray10  = ['626262', 242]
    let s:bwc.gray09  = ['626262', 241]
    let s:bwc.gray08  = ['585858', 240]
    let s:bwc.gray07  = ['3a3a3a', 239]
    let s:bwc.gray06  = ['3a3a3a', 238]
    let s:bwc.gray05  = ['3a3a3a', 237]
    let s:bwc.gray04  = ['303030', 236]
    let s:bwc.gray03  = ['262626', 235]
    let s:bwc.gray02  = ['1c1c1c', 234]
    let s:bwc.gray01  = ['121212', 233]
    let s:bwc.gray00  = ['000000', 232]

    let s:bwc.nyellow  = ['ffcc66', 221]
    let s:bwc.byellow  = ['ff0066', 220]
    let s:bwc.ngreen   = ['66cc00', 112]
    let s:bwc.bgreen   = ['00ff00', 22]
    let s:bwc.nblue    = ['6666ff', 75]
    let s:bwc.bblue    = ['0066cc', 25]
    let s:bwc.nred     = ['ff6666', 203]
    let s:bwc.bred     = ['ff0000', 161]
    let s:bwc.nmagenta = ['9966ff', 99]
    let s:bwc.bmagenta = ['cc66ff', 134]
    let s:bwc.ncyan    = ['66ccff', 117]  "74 alt
    let s:bwc.bcyan    = ['66ffff', 80]

    " let s:bwc.ntest     = ['ff6666', 222]
    " let s:bwc.ntest     = ['ff6666', 134]
    " let s:bwc.ntest     = ['ff6666', 15]
    " let s:bwc.ntest     = ['ff6666', 221]
else

    let s:bwc.gray24  = ['ffffff', 232] "0
    let s:bwc.gray23  = ['eeeeee', 233] "1
    let s:bwc.gray20  = ['d0d0d0', 236] "4
    let s:bwc.gray18  = ['bcbcbc', 238] "6
    let s:bwc.gray13  = ['8a8a8a', 243] "11
    let s:bwc.gray11  = ['767676', 245] "13
    let s:bwc.gray10  = ['626262', 246] "14
    let s:bwc.gray09  = ['626262', 247] "15
    let s:bwc.gray08  = ['585858', 248] "16
    let s:bwc.gray07  = ['3a3a3a', 249] "17
    let s:bwc.gray06  = ['3a3a3a', 250] "18
    let s:bwc.gray05  = ['3a3a3a', 251] "19
    let s:bwc.gray04  = ['303030', 252] "20
    let s:bwc.gray03  = ['262626', 253] "21
    let s:bwc.gray02  = ['1c1c1c', 254] "22
    let s:bwc.gray01  = ['121212', 255] "23
    let s:bwc.gray00  = ['000000', 231] "24

    let s:bwc.nyellow  = ['ffcc66', 94]
    let s:bwc.byellow  = ['ff0066', 230]
    let s:bwc.ngreen   = ['66cc00', 22]
    let s:bwc.bgreen   = ['00ff00', 157]
    let s:bwc.nblue    = ['6666ff', 25]
    let s:bwc.bblue    = ['0066cc', 75]
    let s:bwc.nred     = ['ff6666', 88]
    let s:bwc.bred     = ['ff0000', 217]
    let s:bwc.nmagenta = ['9966ff', 52] "was 89
    let s:bwc.bmagenta = ['cc66ff', 225]
    let s:bwc.ncyan    = ['66ccff', 23]  "74 alt
    let s:bwc.bcyan    = ['66ffff', 80]

    " let s:bwc.ntest     = ['ff6666', 94]
    " let s:bwc.ntest     = ['ff6666', 94]
    " let s:bwc.ntest     = ['ff6666', 15]
    " let s:bwc.ntest     = ['ff6666', 130]
    " let s:bwc.ntest     = ['ff6666', 166]
    " let s:bwc.ntest     = ['ff6666', 124]
    " let s:bwc.btest     = ['ff6666', 230]
endif
" }}}

" Highlighting Function {{{
function! s:HL(group, fg, ...)
    " Arguments: group, guifg, guibg, gui, guisp

    let histring = 'hi ' . a:group . ' '

    if strlen(a:fg)
        if a:fg == 'fg'
            let histring .= 'guifg=fg ctermfg=fg '
        else
            let c = get(s:bwc, a:fg)
            let histring .= 'guifg=#' . c[0] . ' ctermfg=' . c[1] . ' '
        endif
    endif

    if a:0 >= 1 && strlen(a:1)
        if a:1 == 'bg'
            let histring .= 'guibg=bg ctermbg=bg '
        else
            let c = get(s:bwc, a:1)
            let histring .= 'guibg=#' . c[0] . ' ctermbg=' . c[1] . ' '
        endif
    endif

    if a:0 >= 2 && strlen(a:2)
        let histring .= 'gui=' . a:2 . ' cterm=' . a:2 . ' '
    endif

    if a:0 >= 3 && strlen(a:3)
        let c = get(s:bwc, a:3)
        let histring .= 'guisp=#' . c[0] . ' '
    endif

    execute histring
endfunction
" }}}
" Configuration Options {{{

if exists('g:trafficlights_darkgutter') && g:trafficlights_darkgutter
    let s:gutter = 'gray04'
else
    let s:gutter = 'nocol'
endif

" }}}

" Actual colorscheme ----------------------------------------------------------
" Vanilla Vim {{{

" General/UI {{{

" call 'hi Normal ctermbg=NONE'
call s:HL('Normal', 'gray20', '', 'none')

call s:HL('Folded', 'gray09', 'nocol', 'none')

call s:HL('VertSplit', 'gray03', 'nocol', 'none')
" call s:HL('VertSplit', 'gray13', 'nocol', 'none')

if &background == 'dark'
    call s:HL('CursorLine',   '', 'gray02', 'none')
else
    call s:HL('CursorLine',   '', 'gray02', 'none')
endif
    
call s:HL('CursorColumn', '', 'gray02')
call s:HL('ColorColumn',  '', 'gray02')

call s:HL('TabLine', 'gray03', 'gray08', 'none')
call s:HL('TabLineFill', 'gray18', 'nocol', 'none')
call s:HL('TabLineSel', 'gray01', 'gray13', 'none')

call s:HL('MatchParen', 'gray02', 'gray20', 'bold')

call s:HL('NonText',    'gray05', 'nocol')
call s:HL('SpecialKey', 'gray05', 'nocol')

call s:HL('Visual',    '',  'gray05')
call s:HL('VisualNOS', '',  'gray05')

if &background == 'dark'
    " call s:HL('Search',    'gray00', 'nyellow', 'none')
    " call s:HL('IncSearch', 'gray00', 'byellow',    'none')
    call s:HL('Search',    'gray01', 'gray13', 'none')
    call s:HL('IncSearch', 'gray00', 'nmagenta',    'none')
else
    call s:HL('Search',    'gray01', 'gray13', 'none')
    call s:HL('IncSearch', 'gray00', 'nmagenta',    'none')
endif

call s:HL('Underlined', 'nocol', '', 'underline')

if &background == 'dark'
    call s:HL('StatusLine',   'gray01', 'gray13', 'none')
    call s:HL('StatusLineNC', 'gray13', 'gray04', 'none')
else
    call s:HL('StatusLine',   'gray18', 'gray07', 'none')
    call s:HL('StatusLineNC', 'gray13', 'gray04', 'none')
    " call s:HL('StatusLine',   'gray23', 'gray07', 'none')
    " call s:HL('StatusLineNC', 'gray13', 'gray04', 'none')
endif
call s:HL('User1', 'gray02', 'gray10', 'none')
" call s:HL('User1', 'nred', 'gray04', 'none')
call s:HL('User2', 'gray09', 'gray04', 'none')
call s:HL('User3', 'nyellow', 'gray04', 'none' )
call s:HL('User4', 'nblue', 'gray04', 'none')
call s:HL('User5', 'nmagenta', 'gray04', 'none')
call s:HL('User6', 'ncyan', 'gray04', 'none')
call s:HL('User7', 'gray18', 'gray03', 'none')
call s:HL('User8', 'gray24', 'nblue', 'none')
call s:HL('User9', 'gray24', 'nmagenta', 'none')
call s:HL('User0', 'gray24', 'gray08', 'none')

call s:HL('Directory', 'nblue', '', 'none')

call s:HL('Title', 'ngreen')

call s:HL('ErrorMsg', 'nred', 'nocol', 'none')
call s:HL('MoreMsg', 'nyellow', '', 'none')
call s:HL('ModeMsg', 'ngreen', '', 'none')
call s:HL('Question', 'nblue', '', 'none')
call s:HL('WarningMsg', 'nmagenta', '', 'none')

" This is a ctags tag, not an HTML one.  'Something you can use c-] on'.
call s:HL('Tag', '', '', 'bold')
" }}}

" Gutter {{{
call s:HL('CursorLineNr',     'gray18', s:gutter)
if &background == 'dark'
    call s:HL('LineNr',     'gray04', s:gutter)
else
    call s:HL('LineNr',     'gray13', s:gutter)
endif
" call s:HL('LineNr',     'gray05', '', '')
" call 'hi SignColumn guifg=#000000 ctermfg=240 guibg=#000000 ctermbg=233 term=none'
" hi SignColumn guifg=#000000 ctermfg=140 guibg=#000000 ctermbg='' term=none
" call 'hi FoldColumn ctermfg=240 ctermbg=233'
call s:HL('SignColumn', 'nocol', 'nocol', '')
" hi SignColumn ctermbg=none
call s:HL('FoldColumn', 'gray09', 'nocol', '')
" }}}

" Cursor {{{

call s:HL('Cursor',  'gray00', 'nblue', 'bold')
call s:HL('vCursor', 'gray00', 'nblue', 'bold')
call s:HL('iCursor', 'gray00', 'nblue', 'none')

" }}}
" Syntax highlighting {{{

" Start with a simple base.
call s:HL('Special', 'ngreen')

" Comments are slightly brighter than folds, to make 'headers' easier to see.
call s:HL('Comment',        'gray11')
call s:HL('Todo',           'gray13', 'nocol', 'none')
call s:HL('SpecialComment', 'gray24', 'nocol', 'bold')


" Control flow stuff is nred.
call s:HL('Statement',   'gray20', '', 'bold')
call s:HL('Keyword',     'gray20', '', 'bold')
call s:HL('Conditional', 'gray20', '', 'bold')
call s:HL('Operator',    'gray20', '', 'bold')
call s:HL('Label',       'gray20', '', 'bold')
call s:HL('Repeat',      'gray20', '', 'bold')


" Functions and variable declarations are orange, because gray18 looks weird.
call s:HL('Identifier', 'gray18', '', 'none')
if &background == 'dark'
    call s:HL('Function',   'nred', '', 'none')
else
    call s:HL('Function',   'nred', '', 'bold')
endif

" Preprocessor stuff is ngreen, to make it pop.
"
" This includes imports in any given language, because they should usually be
" grouped together at the beginning of a file.  If they're in the middle of some
" other code they should stand out, because something tricky is
" probably going on.
call s:HL('PreProc',   'gray18', '', 'none')
call s:HL('Macro',     'ngreen', '', 'none')
call s:HL('Define',    'ngreen', '', 'none')
call s:HL('PreCondit', 'ngreen', '', 'none')

" Constants of all kinds are colored together.
" I'm not really happy with the color yet...
call s:HL('Constant',  'nblue', '', 'none')
call s:HL('Character', 'nmagenta', '', 'none')
call s:HL('Boolean',   'nmagenta', '', 'none')

call s:HL('Number', 'nmagenta', '', 'none')
call s:HL('Float',  'nred', '', 'none')

call s:HL('String', 'nyellow', '', 'none')

" Not sure what 'special character in a constant' means, but let's make it pop.
call s:HL('SpecialChar', 'bmagenta', '', 'none')

call s:HL('Type', 'nblue', '', 'none')
call s:HL('StorageClass', 'nred', '', 'none')
call s:HL('Structure', 'nred', '', 'none')
call s:HL('Typedef', 'nred', '', 'none')

" Make try/catch blocks stand out.
call s:HL('Exception', 'ngreen', '', 'bold')

" Misc
call s:HL('Error',  'gray24',   'bred', 'bold')
call s:HL('Debug',  'gray24',   '',      'bold')
call s:HL('Ignore', 'gray11', '',      '')

" }}}
" Completion Menu {{{

call s:HL('Pmenu', 'gray18', 'gray05')
call s:HL('PmenuSel', 'gray24', 'nred', 'none')
call s:HL('PmenuSbar', '', 'gray05')
call s:HL('PmenuThumb', 'gray20')

" }}}
" Diffs {{{

" call s:HL('DiffDelete', 'gray01', 'gray233')
" call s:HL('DiffAdd',    'gray18',     'gray05')
" call s:HL('DiffChange', '',     'gray05')
" call s:HL('DiffText',   'gray23', 'gray09', 'none')
" call s:HL('DiffDelete', 'gray01', 'gray233')
" call s:HL('DiffAdd',    '',     'gray03')
" call s:HL('DiffChange', '',     'gray03')
" call s:HL('DiffText',   'nocol', 'gray05', 'none')

call s:HL('DiffDelete', 'nred', 'bred')
call s:HL('DiffAdd',    'ngreen',     'bgreen')
call s:HL('DiffChange', 'nblue',     'bblue')
if &background == 'dark'
    call s:HL('DiffText',   'gray24', 'nblue', 'none')
else
    call s:HL('DiffText',   'gray00', 'nblue', 'none')
endif

" }}}
" Netrw {{{

call s:HL('netrwSymLink', 'ncyan', '')
call s:HL('netrwClassify', 'gray18', '')

" }}}
" Spelling {{{

if has("spell")
    call s:HL('SpellCap', 'nyellow', 'nocol', 'none')
    call s:HL('SpellBad', '', 'nocol', 'underline')
    call s:HL('SpellLocal', '', '', 'undercurl', 'nyellow')
    call s:HL('SpellRare', '', '', 'undercurl', 'nyellow')
endif

" }}}

" }}}
" Plugins {{{

" CtrlP {{{

    " the message when no match is found
    call s:HL('CtrlPNoEntries', 'gray24', 'bred', 'none')

    " the matched pattern
    call s:HL('CtrlPMatch', 'nyellow', '', 'none')

    " the line prefix '>' in the match window
    call s:HL('CtrlPLinePre', 'gray08', 'nocol', 'none')

    " the prompt’s base
    call s:HL('CtrlPPrtBase', 'gray08', 'nocol', 'none')

    " the prompt’s text
    call s:HL('CtrlPPrtText', 'gray18', 'nocol', 'none')

    " the prompt’s cursor when moving over the text
    call s:HL('CtrlPPrtCursor', 'gray00', 'bblue', 'bold')

    " 'prt' or 'win', also for 'regex'
    call s:HL('CtrlPMode1', 'gray00', 'ngreen', 'bold')

    " 'file' or 'path', also for the local working dir
    call s:HL('CtrlPMode2', 'gray00', 'ngreen', 'bold')

    " the scanning status
    call s:HL('CtrlPStats', 'gray00', 'bblue', 'bold')

    " TODO: CtrlP extensions.
    " CtrlPTabExtra  : the part of each line that’s not matched against (Comment)
    " CtrlPqfLineCol : the line and column numbers in quickfix mode (|s:HL-Search|)
    " CtrlPUndoT     : the elapsed time in undo mode (|s:HL-Directory|)
    " CtrlPUndoBr    : the square brackets [] in undo mode (Comment)
    " CtrlPUndoNr    : the undo number inside [] in undo mode (String)

" }}}
" EasyMotion {{{

call s:HL('EasyMotionTarget', 'nblue',     'nocol', 'bold')
call s:HL('EasyMotionShade',  'gray08', 'nocol')

" }}}
" Interesting Words {{{

" These are only used if you're me or have copied the <leader>hNUM mappings
" from my Vimrc.
call s:HL('InterestingWord1', 'gray00', 'byellow')
call s:HL('InterestingWord2', 'gray00', 'ngreen')
call s:HL('InterestingWord3', 'gray00', 'bgreen')
call s:HL('InterestingWord4', 'gray00', 'nmagenta')
call s:HL('InterestingWord5', 'gray00', 'bmagenta')
call s:HL('InterestingWord6', 'gray00', 'nred')


" }}}
" Makegreen {{{

" hi GreenBar term=reverse ctermfg=gray24 ctermbg=green guifg=gray00 guibg=#9edf1c
" hi RedBar   term=reverse ctermfg=gray24 ctermbg=red guifg=white guibg=#C50048

" }}}
" Rainbow Parentheses {{{

call s:HL('level16c', 'gray09',   '', 'bold')
call s:HL('level15c', 'nyellow',      '', '')
call s:HL('level14c', 'bmagenta',          '', '')
call s:HL('level13c', 'byellow',         '', '')
call s:HL('level12c', 'nblue',         '', '')
call s:HL('level11c', 'ngreen',           '', '')
call s:HL('level10c', 'nmagenta',         '', '')
call s:HL('level9c',  'bgreen', '', '')
call s:HL('level8c',  'byellow',         '', '')
call s:HL('level7c',  'nyellow',      '', '')
call s:HL('level6c',  'bmagenta',          '', '')
call s:HL('level5c',  'byellow',         '', '')
call s:HL('level4c',  'nblue',         '', '')
call s:HL('level3c',  'ngreen',           '', '')
call s:HL('level2c',  'nmagenta',         '', '')
call s:HL('level1c',  'bgreen', '', '')

" }}}
" ShowMarks {{{

call s:HL('ShowMarksHLl', 'nblue', 'gray01')
call s:HL('ShowMarksHLu', 'nblue', 'gray01')
call s:HL('ShowMarksHLo', 'nblue', 'gray01')
call s:HL('ShowMarksHLm', 'nblue', 'gray01')

" }}}
" ShowMarks {{{

call s:HL('IndentGuidesOdd', 'gray11', 'nocol')
call s:HL('IndentGuidesEven', 'gray02', 'gray03')

" }}}
" ShowMarks {{{

call s:HL('TagBarScope', 'nmagenta', '')
call s:HL('TagBarKind', 'nred', '')
call s:HL('TagBarNestedKind', 'nred', '')
call s:HL('TagBarType', 'bmagenta', '')
call s:HL('TagBarFoldIcon', 'gray11', '')
call s:HL('TagBarVisibilityPublic', 'ngreen', '')
call s:HL('TagBarVisibilityProtected', 'nyellow', '')
call s:HL('TagBarVisibilityPrivate', 'nred', '')

" }}}

" }}}
" Filetype-specific {{{

" Clojure {{{

call s:HL('clojureSpecial',  'nred', '', '')
call s:HL('clojureDefn',     'nred', '', '')
call s:HL('clojureDefMacro', 'nred', '', '')
call s:HL('clojureDefine',   'nred', '', '')
call s:HL('clojureMacro',    'nred', '', '')
call s:HL('clojureCond',     'nred', '', '')

call s:HL('clojureKeyword', 'byellow', '', 'none')

call s:HL('clojureFunc',   'bmagenta', '', 'none')
call s:HL('clojureRepeat', 'bmagenta', '', 'none')

call s:HL('clojureParen0', 'gray13', '', 'none')

call s:HL('clojureAnonArg', 'gray24', '', 'bold')

" }}}
" CSS {{{

if g:trafficlights_css_props_highlight
    call s:HL('cssColorProp', 'nyellow', '', 'none')
    call s:HL('cssBoxProp', 'nyellow', '', 'none')
    call s:HL('cssTextProp', 'nyellow', '', 'none')
    call s:HL('cssRenderProp', 'nyellow', '', 'none')
    call s:HL('cssGeneratedContentProp', 'nyellow', '', 'none')
    call s:HL('cssPositioningProp', 'nyellow', '', 'none')
    call s:HL('cssDimensionProp', 'nyellow', '', 'none')
    call s:HL('cssBackgroundProp', 'nyellow', '', 'none')
else
    call s:HL('cssColorProp', 'nocol', '', 'none')
    call s:HL('cssBoxProp', 'nocol', '', 'none')
    call s:HL('cssTextProp', 'nocol', '', 'none')
    call s:HL('cssRenderProp', 'nocol', '', 'none')
    call s:HL('cssGeneratedContentProp', 'nocol', '', 'none')
end

call s:HL('cssValueLength', 'byellow', '', 'none')
call s:HL('cssColor', 'byellow', '', 'none')
call s:HL('cssBraces', 'gray13', '', 'none')
call s:HL('cssIdentifier', 'bmagenta', '', 'none')
call s:HL('cssClassName', 'nmagenta', '', 'none')
call s:HL('cssTagName', 'nocol', '', 'none')
call s:HL('cssDefinition', 'nyellow', '', 'none')
call s:HL('cssUnitDecorators', 'nred', '', 'none')
call s:HL('cssCommonAttr', 'byellow', '', 'none')
" }}}

" javascript {{{

call s:HL('javaScriptIdentifier', 'nmagenta', '', 'none')
call s:HL('javaScriptBoolean', 'nred', '', 'none')
call s:HL('javaScriptBraces', 'nocol', '', 'none')
call s:HL('javaScriptMember', 'ngreen', '', 'none')
" }}}
" Diff {{{

call s:HL('gitDiff', 'gray13', '',)

call s:HL('diffRemoved', 'nred', '',)
call s:HL('diffAdded', 'ngreen', '',)
call s:HL('diffFile', 'nyellow', '', '')
call s:HL('diffNewFile', 'nyellow', '', '')

call s:HL('diffLine', 'nyellow', '', '')
call s:HL('diffSubname', 'byellow', '', '')

" }}}
" Django Templates {{{

call s:HL('djangoArgument', 'byellow', '',)
call s:HL('djangoTagBlock', 'byellow', '')
call s:HL('djangoVarBlock', 'byellow', '')
" hi djangoStatement guifg=#ff3853 gui=bold
" hi djangoVarBlock guifg=#f4cf86

" }}}
" HTML {{{
" call s:HL('htmlString', 'nmagenta', 'nocol', 'none')

" Punctuation
call s:HL('htmlTag',    'gray18', 'nocol', 'none')
call s:HL('htmlEndTag', 'gray18', 'nocol', 'none')

" Tag names
call s:HL('htmlTagName',        'nred', '', 'none')
call s:HL('htmlTagN',        'gray18', '', 'none')
call s:HL('htmlSpecialTagName', 'ngreen', '', 'none')
call s:HL('htmlSpecialChar',    'nred',   '', 'none')

" Attributes
call s:HL('htmlArg', 'ncyan', '', 'none')

call s:HL('htmlTitle', 'gray20', '', 'none')
call s:HL('htmlH1', 'gray20', '', 'none')
call s:HL('htmlH2', 'gray20', '', 'none')
call s:HL('htmlH3', 'gray20', '', 'none')
call s:HL('htmlH4', 'gray20', '', 'none')
call s:HL('htmlH5', 'gray20', '', 'none')
call s:HL('htmlH6', 'gray20', '', 'none')

" Stuff inside an <a> tag

if g:trafficlights_html_link_underline
    call s:HL('htmlLink', 'gray13', '', 'underline')
else
    call s:HL('htmlLink', 'gray18', '', 'none')
endif

" }}} 
" Java {{{

call s:HL('javaClassDecl', 'nmagenta', '', 'none')
call s:HL('javaScopeDecl', 'gray20', '', 'bold')
call s:HL('javaCommentTitle', 'gray11', '')
call s:HL('javaDocTags', 'gray10', '', 'none')
call s:HL('javaDocParam', 'gray18', '', '')
call s:HL('javaStorageClass', 'nmagenta', '', '')
call s:HL('javaAnnotation', 'nmagenta', '', '')
call s:HL('javaTypedef', 'ncyan', '', '')
call s:HL('javaType', 'nblue', '', 'none')
call s:HL('javaBraces', 'gray18', '', '')
call s:HL('javaExternal', 'ngreen', '', '')
call s:HL('javaSpecialChar', 'ngreen', '', '')

" }}}
" LaTeX {{{

call s:HL('texStatement', 'nblue', '', 'none')
call s:HL('texMathZoneX', 'byellow', '', 'none')
call s:HL('texMathZoneA', 'byellow', '', 'none')
call s:HL('texMathZoneB', 'byellow', '', 'none')
call s:HL('texMathZoneC', 'byellow', '', 'none')
call s:HL('texMathZoneD', 'byellow', '', 'none')
call s:HL('texMathZoneE', 'byellow', '', 'none')
call s:HL('texMathZoneV', 'byellow', '', 'none')
call s:HL('texMathZoneX', 'byellow', '', 'none')
call s:HL('texMath', 'byellow', '', 'none')
call s:HL('texMathMatcher', 'byellow', '', 'none')
call s:HL('texRefLabel', 'byellow', '', 'none')
call s:HL('texRefZone', 'ngreen', '', 'none')
call s:HL('texComment', 'gray11', '', 'none')
call s:HL('texDelimiter', 'byellow', '', 'none')
call s:HL('texZone', 'gray20', '', 'none')

augroup trafficlights_tex
    au!

    au BufRead,BufNewFile *.tex syn region texMathZoneV start="\\(" end="\\)\|%stopzone\>" keepend contains=@texMathZoneGroup
    au BufRead,BufNewFile *.tex syn region texMathZoneX start="\$" skip="\\\\\|\\\$" end="\$\|%stopzone\>" keepend contains=@texMathZoneGroup
augroup END

" }}}
" LessCSS {{{

call s:HL('lessVariable', 'ngreen', '', 'none')

" }}}
" Lispyscript {{{

call s:HL('lispyscriptDefMacro', 'ngreen', '', '')
call s:HL('lispyscriptRepeat', 'bmagenta', '', 'none')

" }}}
" Mail {{{

call s:HL('mailSubject', 'byellow', '', 'bold')
call s:HL('mailHeader', 'gray13', '', '')
call s:HL('mailHeaderKey', 'gray13', '', '')
call s:HL('mailHeaderEmail', 'gray24', '', '')
call s:HL('mailURL', 'nmagenta', '', 'underline')
call s:HL('mailSignature', 'gray11', '', 'none')

call s:HL('mailQuoted1', 'gray11', '', 'none')
call s:HL('mailQuoted2', 'bmagenta', '', 'none')
call s:HL('mailQuoted3', 'byellow', '', 'none')
call s:HL('mailQuoted4', 'byellow', '', 'none')
call s:HL('mailQuoted5', 'ngreen', '', 'none')

" }}}
" Markdown {{{

call s:HL('markdownHeadingRule', 'gray13', '', 'none')
call s:HL('markdownHeadingDelimiter', 'gray13', '', 'none')
call s:HL('markdownOrderedListMarker', 'gray13', '', 'none')
call s:HL('markdownListMarker', 'gray13', '', 'none')
call s:HL('markdownItalic', 'nyellow', '', 'none')
call s:HL('markdownBold', 'nyellow', '', 'none')
call s:HL('markdownH1', 'gray24', '', 'none')
call s:HL('markdownH2', 'gray20', '', 'none')
call s:HL('markdownH3', 'gray18', '', 'none')
call s:HL('markdownH4', 'gray18', '', 'none')
call s:HL('markdownH5', 'gray18', '', 'none')
call s:HL('markdownH6', 'gray18', '', 'none')
call s:HL('markdownLinkText', 'bmagenta', '', 'underline')
call s:HL('markdownIdDeclaration', 'nmagenta')
call s:HL('markdownAutomaticLink', 'nmagenta', '', 'none')
call s:HL('markdownUrl', 'nmagenta', '', 'none')
call s:HL('markdownUrldelimiter', 'gray13', '', 'none')
" call s:HL('markdownLinkDelimiter', 'gray13', '', 'none')
call s:HL('markdownLinkTextDelimiter', 'gray13', '', 'none')
call s:HL('markdownCodeDelimiter', 'ncyan', '', 'none')
call s:HL('markdownCode', 'nblue', '', 'none')
call s:HL('markdownCodeBlock', 'ncyan', '', 'none')

" }}}
" MySQL {{{

call s:HL('mysqlSpecial', 'bmagenta', '', 'bold')

" }}}
" Python {{{

hi def link pythonOperator Operator
call s:HL('pythonBuiltin',     'nblue')
call s:HL('pythonBuiltinObj',  'nblue')
call s:HL('pythonBuiltinFunc', 'nblue')
call s:HL('pythonEscape',      'nblue')
call s:HL('pythonException',   'ngreen', '', 'bold')
call s:HL('pythonExceptions',  'ngreen', '', 'none')
call s:HL('pythonPrecondit',   'ngreen', '', 'none')
call s:HL('pythonInclude', 'ngreen', '', 'none')
call s:HL('pythonDecorator',   'nred', '', 'none')
call s:HL('pythonRun',         'gray11', '', 'bold')
call s:HL('pythonCoding',      'gray11', '', 'bold')

" }}}

" Ruby {{{
call s:HL('rubyBlock',     'gray20', '', 'bold')
call s:HL('rubyClass',     'gray20', '', 'bold')
call s:HL('rubyModule',     'gray20', '', 'bold')
call s:HL('rubyInclude',     'gray20', '', 'bold')
call s:HL('rubyDefine',     'gray20', '', 'bold')
call s:HL('rubyConstant',     'ncyan', '', 'none')
call s:HL('rubyPseudoVariable',     'nblue', '', 'none')
" }}}

" SLIMV {{{

" Rainbow parentheses
call s:HL('hlLevel0', 'gray11')
call s:HL('hlLevel1', 'byellow')
call s:HL('hlLevel2', 'bgreen')
call s:HL('hlLevel3', 'bmagenta')
call s:HL('hlLevel4', 'byellow')
call s:HL('hlLevel5', 'byellow')
call s:HL('hlLevel6', 'byellow')
call s:HL('hlLevel7', 'bgreen')
call s:HL('hlLevel8', 'bmagenta')
call s:HL('hlLevel9', 'byellow')

" }}}
" Vim {{{

call s:HL('VimCommentTitle', 'gray13', '', 'bold')

call s:HL('VimMapMod',    'gray20', '', 'none')
call s:HL('VimMapModKey', 'gray20', '', 'bold')
call s:HL('VimNotation', 'gray20', '', 'none')
call s:HL('VimBracket', 'gray20', '', 'none')
call s:HL('VimParenSep', 'nocol', '', 'none')
call s:HL('VimOption', 'nblue', '', 'none')

" }}}

" sh {{{

call s:HL('shDerefSimple', 'gray18', '')
call s:HL('shFunctionKey', 'gray18', 'nocol', 'bold')
call s:HL('shFunction', 'nmagenta', 'nocol', '')
call s:HL('shCommandSub', 'nocol', '', '')
call s:HL('shCmdSubRegion', 'ngreen', '')
call s:HL('shSpecial', 'gray18', '')
call s:HL('shDeref', 'gray18', '')

" }}}

" zsh {{{
call s:HL('zshDeref', 'nmagenta', '')
call s:HL('zshQuoted', 'nred', '')
call s:HL('zshTypes', 'gray18', '')
call s:HL('zshSubst', 'nmagenta', '')
" }}}

" quickfix {{{
call s:HL('qfFilename', 'nmagenta', '')
call s:HL('qfSeparator', 'nocol', '')
call s:HL('qfLineNr', 'bmagenta', '')
" }}}

" }}}

