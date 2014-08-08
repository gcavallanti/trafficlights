"
" A Vim colorscheme by Giovanni Cavallanti.
"
" Available at http://github.com/gcavn/trafficlights/
"

" Supporting code ------------------------------------------------------------- {{{
" Preamble {{{
if !has("gui_running") && &t_Co != 88 && &t_Co != 256
    finish
endif

if exists("syntax_on")
    syntax reset
endif

let colors_name = "trafficlights"

if !exists("g:trafficlights_html_link_underline")
    let g:trafficlights_html_link_underline = 1
endif 

if !exists("g:trafficlights_css_props_highlight")
    let g:trafficlights_css_props_highlight = 0
endif 
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
    let s:bwc.ncyan    = ['66ccff', 80]  "74 alt
    let s:bwc.bcyan    = ['66ffff', 80]

    " let s:bwc.ntest     = ['ff6666', 81]
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

    let s:bwc.nyellow  = ['ffcc66', 88]
    let s:bwc.byellow  = ['ff0066', 230]
    let s:bwc.ngreen   = ['66cc00', 22]
    let s:bwc.bgreen   = ['00ff00', 157]
    let s:bwc.nblue    = ['6666ff', 25]
    let s:bwc.bblue    = ['0066cc', 75]
    let s:bwc.nred     = ['ff6666', 52]
    let s:bwc.bred     = ['ff0000', 217]
    let s:bwc.nmagenta = ['9966ff', 53] "was 89
    let s:bwc.bmagenta = ['cc66ff', 225]
    let s:bwc.ncyan    = ['66ccff', 24]  "74 alt
    let s:bwc.bcyan    = ['66ffff', 80]

    " let s:bwc.ntest     = ['ff6666', 94]
    " let s:bwc.ntest     = ['ff6666', 94]
    " let s:bwc.ntest     = ['ff6666', 24]
    " let s:bwc.ntest     = ['ff6666', 56]
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

" }}}

" Actual colorscheme ---------------------------------------------------------- {{{
" Vim {{{

" General/UI {{{

" call 'hi Normal ctermbg=NONE'
call s:HL('Normal', 'gray20', '', 'none')
call s:HL('Folded', 'gray09', 'nocol', 'none')
call s:HL('VertSplit', 'gray10', 'nocol', 'none')

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

call s:HL('Search',    'gray01', 'gray13', 'none')
call s:HL('IncSearch', 'gray00', 'nmagenta',    'none')
call s:HL('Underlined', 'nocol', '', 'underline')

if &background == 'dark'
    call s:HL('StatusLine',   'gray03', 'gray13', 'none')
    call s:HL('StatusLineNC', 'gray13', 'gray04', 'none')
else
    call s:HL('StatusLine',   'gray18', 'gray07', 'none')
    call s:HL('StatusLineNC', 'gray13', 'gray04', 'none')
    " call s:HL('StatusLine',   'gray23', 'gray07', 'none')
    " call s:HL('StatusLineNC', 'gray13', 'gray04', 'none')
endif
call s:HL('User1', 'gray02', 'gray10', 'none')
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

call s:HL('Tag', '', '', 'bold')
" }}}

" Gutter {{{
call s:HL('CursorLineNr',     'gray18', s:gutter)
if &background == 'dark'
    call s:HL('LineNr',     'gray04', s:gutter)
else
    call s:HL('LineNr',     'gray13', s:gutter)
endif
call s:HL('SignColumn', 'nocol', 'nocol', '')
call s:HL('FoldColumn', 'gray09', 'nocol', '')
" }}}

" Cursor {{{
call s:HL('Cursor',  'gray00', 'nblue', 'bold')
call s:HL('vCursor', 'gray00', 'nblue', 'bold')
call s:HL('iCursor', 'gray00', 'nblue', 'none')
" }}}

" Syntax highlighting {{{
call s:HL('Special', 'ngreen')

call s:HL('Comment',        'gray11')
call s:HL('Todo',           'gray13', 'nocol', 'none')
call s:HL('SpecialComment', 'gray24', 'nocol', 'bold')

call s:HL('Statement',   'gray20', '', 'bold')
call s:HL('Keyword',     'gray20', '', 'bold')
call s:HL('Conditional', 'gray20', '', 'bold')
call s:HL('Operator',    'gray20', '', 'bold')
call s:HL('Label',       'gray20', '', 'bold')
call s:HL('Repeat',      'gray20', '', 'bold')

call s:HL('Identifier', 'gray18', '', 'none')
if &background == 'dark'
    call s:HL('Function',   'nred', '', 'none')
else
    call s:HL('Function',   'nred', '', 'bold')
endif

call s:HL('PreProc',   'gray18', '', 'none')
call s:HL('Macro',     'ngreen', '', 'none')
call s:HL('Define',    'ngreen', '', 'none')
call s:HL('PreCondit', 'ngreen', '', 'none')

call s:HL('Constant',  'nblue', '', 'none')
call s:HL('Character', 'nmagenta', '', 'none')
call s:HL('Boolean',   'nmagenta', '', 'none')

call s:HL('Number', 'ncyan', '', 'none')
call s:HL('Float',  'nmagenta', '', 'none')

call s:HL('String', 'nyellow', '', 'none')

call s:HL('SpecialChar', 'bmagenta', '', 'none')

call s:HL('Type', 'nblue', '', 'none')
call s:HL('StorageClass', 'nred', '', 'none')
call s:HL('Structure', 'nred', '', 'none')
call s:HL('Typedef', 'nred', '', 'none')

call s:HL('Exception', 'ngreen', '', 'bold')

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

" Wildmenu {{{
call s:HL('WildMenu', 'gray23', 'gray06')
" }}}

" Help {{{
call s:HL('helpHyperTextEntry', 'nmagenta', '')
call s:HL('helpSpecial', 'nblue', '')
call s:HL('helpExample', 'nyellow', '')
" }}}

" Diffs {{{
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
    call s:HL('CtrlPNoEntries', 'gray24', 'bred', 'none')
    call s:HL('CtrlPMatch', 'nyellow', '', 'none')
    call s:HL('CtrlPLinePre', 'gray08', 'nocol', 'none')
    call s:HL('CtrlPPrtBase', 'gray20', 'nocol', 'none')
    call s:HL('CtrlPPrtText', 'gray08', 'nocol', 'none')
    call s:HL('CtrlPPrtCursor', 'gray23', 'gray06', 'none')
    call s:HL('CtrlPMode1', 'gray23', 'gray06', 'none')
    call s:HL('CtrlPMode2', 'gray00', 'gray13', 'none')
    call s:HL('CtrlPStats', 'gray00', 'gray13', 'none')
" }}}

" EasyMotion {{{
call s:HL('EasyMotionTarget', 'nblue',     'nocol', 'bold')
call s:HL('EasyMotionShade',  'gray08', 'nocol')
" }}}

" ShowMarks {{{
call s:HL('IndentGuidesOdd', 'gray11', 'nocol')
call s:HL('IndentGuidesEven', 'gray02', 'gray03')
" }}}

" TagBar {{{
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
" }}}

" HTML {{{
call s:HL('htmlTag',    'gray18', 'nocol', 'none')
call s:HL('htmlEndTag', 'gray18', 'nocol', 'none')
call s:HL('htmlTagName',        'nred', '', 'none')
call s:HL('htmlTagN',        'gray18', '', 'none')
call s:HL('htmlSpecialTagName', 'ngreen', '', 'none')
call s:HL('htmlSpecialChar',    'nred',   '', 'none')
call s:HL('htmlArg', 'ncyan', '', 'none')
call s:HL('htmlTitle', 'gray20', '', 'none')
call s:HL('htmlH1', 'gray20', '', 'none')
call s:HL('htmlH2', 'gray20', '', 'none')
call s:HL('htmlH3', 'gray20', '', 'none')
call s:HL('htmlH4', 'gray20', '', 'none')
call s:HL('htmlH5', 'gray20', '', 'none')
call s:HL('htmlH6', 'gray20', '', 'none')
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

" Python {{{
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
call s:HL('rubyRegexp',     'ngreen', '', 'none')
call s:HL('rubyModule',     'gray20', '', 'bold')
call s:HL('rubyInclude',     'gray20', '', 'bold')
call s:HL('rubySymbol',     'nmagenta', '', 'none')
call s:HL('rubyDefine',     'gray20', '', 'bold')
call s:HL('rubyConstant',     'ncyan', '', 'none')
call s:HL('rubyPseudoVariable',     'nblue', '', 'none')
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

" }}}

