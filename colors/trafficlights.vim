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
" }}}

" Palette {{{
let s:bwc = {}
let s:bwc.gray24  = ['#ffffff', 231]
let s:bwc.gray23  = ['#eeeeee', 255]
let s:bwc.gray22  = ['#e4e4e4', 254] "
let s:bwc.gray21  = ['#dadada', 253] "
let s:bwc.gray20  = ['#d0d0d0', 252]
let s:bwc.gray19  = ['#c6c6c6', 251]
let s:bwc.gray18  = ['#bcbcbc', 250]
let s:bwc.gray17  = ['#b2b2b2', 249]
let s:bwc.gray16  = ['#a8a8a8', 248] "
let s:bwc.gray15  = ['#9e9e9e', 247]
let s:bwc.gray14  = ['#949494', 246] "
let s:bwc.gray13  = ['#8a8a8a', 245]
let s:bwc.gray12  = ['#808080', 244] "
let s:bwc.gray11  = ['#767676', 243] "
let s:bwc.gray10  = ['#6c6c6c', 242]
let s:bwc.gray09  = ['#626262', 241]
let s:bwc.gray08  = ['#585858', 240] "
let s:bwc.gray07  = ['#4e4e4e', 239]
let s:bwc.gray06  = ['#444444', 238]
let s:bwc.gray05  = ['#3a3a3a', 237] "
let s:bwc.gray04  = ['#303030', 236]
let s:bwc.gray03  = ['#262626', 235]
let s:bwc.gray02  = ['#1c1c1c', 234] "
let s:bwc.gray01  = ['#121212', 233]
let s:bwc.gray00  = ['#080808', 232]
if &background == 'dark'

    let s:bwc.vlcontrast = s:bwc.gray03
    let s:bwc.lcontrast = s:bwc.gray06
    let s:bwc.hcontrast = s:bwc.gray18
    let s:bwc.vhcontrast = s:bwc.gray21
    let s:bwc.acontrast = s:bwc.gray12

    let s:bwc.nred     = ['#ff5f87', 204]
    let s:bwc.bred     = ['#87005f', 89]
    let s:bwc.ngreen   = ['#87d700', 112]
    let s:bwc.bgreen   = ['#008700', 28]
    let s:bwc.nyellow  = ['#ffd757', 221]
    let s:bwc.byellow  = ['#ff8700', 208]
    let s:bwc.nblue    = ['#5f87ff', 69]
    let s:bwc.bblue    = ['#005fd7', 26]
    let s:bwc.nmagenta = ['#875fff', 99]
    let s:bwc.bmagenta = ['#5f00af', 55]
    let s:bwc.ncyan    = ['#5fafff', 75]
    let s:bwc.bcyan    = ['#0087d7', 32]

    let s:bwc.background       = ['#1a1a1a', 232]

else
    let s:bwc.vlcontrast = s:bwc.gray21
    let s:bwc.lcontrast = s:bwc.gray18
    let s:bwc.hcontrast = s:bwc.gray06
    let s:bwc.vhcontrast = s:bwc.gray03
    let s:bwc.acontrast = s:bwc.gray12

    let s:bwc.byellow  = ['#ffd757', 221]
    let s:bwc.nyellow  = ['#ff8700', 208]
    let s:bwc.bgreen   = ['#87d700', 112]
    let s:bwc.ngreen   = ['#008700', 28]
    let s:bwc.bblue    = ['#5f87ff', 69]
    let s:bwc.nblue    = ['#005fd7', 26]
    let s:bwc.bred     = ['#ff5f87', 204]
    let s:bwc.nred     = ['#87005f', 89]
    let s:bwc.bmagenta = ['#875fff', 99]
    let s:bwc.nmagenta = ['#5f00af', 55]
    let s:bwc.bcyan    = ['#5fafff', 75]
    let s:bwc.ncyan    = ['#0087d7', 32]

    let s:bwc.background       = ['#f2f2f2', 232]
endif

""" TEST

let s:bwc.nred     = ['#ff5f87', 1]
let s:bwc.bred     = ['#87005f', 9]
let s:bwc.ngreen   = ['#87d700', 2]
let s:bwc.bgreen   = ['#008700', 10]
let s:bwc.nyellow  = ['#ffd757', 3]
let s:bwc.byellow  = ['#ff8700', 11]
let s:bwc.nblue    = ['#5f87ff', 4]
let s:bwc.bblue    = ['#005fd7', 12]
let s:bwc.nmagenta = ['#875fff', 5]
let s:bwc.bmagenta = ['#5f00af', 13]
let s:bwc.ncyan    = ['#5fafff', 6]
let s:bwc.bcyan    = ['#0087d7', 14]

let s:bwc.lcontrast  = ['#080808', 0]
let s:bwc.vlcontrast  = ['#080808', 8]
let s:bwc.hcontrast  = ['#080808', 15]
let s:bwc.vhcontrast  = ['#080808', 7]
" }}}

let g:trafficlights_darkgutter = 0
" Options {{{
if exists('g:trafficlights_darkgutter') && g:trafficlights_darkgutter
    let s:gutterbg = 'vlcontrast'
    let s:gutterfg = 'acontrast'
else
    let s:gutterbg = 'none'
    let s:gutterfg = 'lcontrast'
endif
" }}}

" Highlighting Function {{{
function! s:HL(group, fg, ...)
    " Arguments: group, guifg/ctermfg, guibg/ctermbg, gui/ctermbg, guisp

    let histring = 'hi ' . a:group . ' '

    if strlen(a:fg)
        if a:fg == 'fg'
            let histring .= 'guifg=fg ctermfg=fg '
        elseif a:fg == 'none'
            let histring .= 'guifg=fg ctermfg=NONE '
        else
            let c = get(s:bwc, a:fg)
            let histring .= 'guifg=' . c[0] . ' ctermfg=' . c[1] . ' '
        endif
    endif

    if a:0 >= 1 && strlen(a:1)
        if a:1 == 'bg'
            let histring .= 'guibg=bg ctermbg=bg '
        elseif a:1 == 'none'
            let histring .= 'guibg=NONE ctermbg=NONE '
        elseif a:1 == 'fg'
            let histring .= 'guibg=fg ctermbg=fg '
        else
            let c = get(s:bwc, a:1)
            let histring .= 'guibg=' . c[0] . ' ctermbg=' . c[1] . ' '
        endif
    endif

    if a:0 >= 2 && strlen(a:2)
        let histring .= 'gui=' . a:2 . ' cterm=' . a:2 . ' '
    endif

    if a:0 >= 3 && strlen(a:3)
        let c = get(s:bwc, a:3)
        let histring .= 'guisp=' . c[0] . ' '
    endif

    execute histring
endfunction
" }}}

" }}}

" Actual colorscheme ---------------------------------------------------------- {{{
" Vim {{{

" General/UI {{{

if has('gui_running')
    call s:HL('Normal', 'gray17', 'background', 'none')
else
    " if &background == 'dark'
    "     call s:HL('Normal', 'gray17', 'none', 'none')
    " else
    "     call s:HL('Normal', 'gray07', 'none', 'none')
    " endif
endif

call s:HL('VertSplit', 'gray12', 'none', 'none')

call s:HL('Folded', 'lcontrast', 'none', 'none')
call s:HL('CursorLine', 'none', 'vlcontrast', 'none')
call s:HL('CursorColumn', 'none', 'vlcontrast', 'none')
call s:HL('ColorColumn', 'none', 'vlcontrast', 'none')
call s:HL('Visual', 'hcontrast', 'lcontrast', 'none')
call s:HL('VisualNOS', 'hcontrast', 'lcontrast', 'none')

" GUI
call s:HL('TabLine', 'gray00', 'gray06', 'none')
call s:HL('TabLineFill', 'gray18', 'none', 'none')
call s:HL('TabLineSel', 'gray00', 'gray12', 'none')

call s:HL('NonText', 'lcontrast', 'none', 'none')
call s:HL('SpecialKey', 'gray12', 'none', 'none')

call s:HL('Search', 'hcontrast', 'lcontrast', 'none')
call s:HL('IncSearch', 'gray00', 'nyellow', 'none')
call s:HL('Underlined', 'none', 'none', 'underline')

call s:HL('Directory', 'nblue', 'none', 'none')

call s:HL('Title', 'ngreen')

call s:HL('ErrorMsg', 'nred', 'none', 'none')
call s:HL('MoreMsg', 'nyellow', 'none', 'none')
call s:HL('ModeMsg', 'ngreen', 'none', 'none')
call s:HL('Question', 'nblue', 'none', 'none')
call s:HL('WarningMsg', 'nmagenta', 'none', 'none')

call s:HL('Tag', 'none', 'none', 'bold')

call s:HL('WildMenu', 'gray24', 'gray06', 'none')

call s:HL('StatusLine', 'gray00', 'gray18', 'none')
call s:HL('StatusLineNC', 'gray00', 'gray12', 'none')
call s:HL('User1', 'gray18', 'gray06', 'none')
call s:HL('User2', 'gray06', 'gray18', 'none')
call s:HL('User3', 'gray24', 'gray03', 'none' )
call s:HL('User4', 'gray00', 'gray18', 'bold')
call s:HL('User5', 'none', 'none', 'none')
call s:HL('User6', 'none', 'none', 'none')
call s:HL('User7', 'none', 'none', 'none')
call s:HL('User8', 'none', 'none', 'none')
call s:HL('User9', 'none', 'none', 'none')
call s:HL('User0', 'none', 'none', 'none')

" Gutter {{{
call s:HL('CursorLineNr', 'hcontrast', 'none', 'none')
call s:HL('LineNr', s:gutterfg, s:gutterbg, 'none')
call s:HL('FoldColumn', 'lcontrast', s:gutterbg, 'none')
call s:HL('SignColumn', 'none', s:gutterbg, 'none')
" }}}

call s:HL('Pmenu', 'gray00', 'gray18', 'none')
call s:HL('PmenuSel', 'gray24', 'gray06', 'none')
call s:HL('PmenuSbar', 'none', 'gray12', 'none')
call s:HL('PmenuThumb', 'gray06', 'gray06', 'none')
 
" Cursor {{{
call s:HL('Cursor', 'gray24', 'bred', 'none')
call s:HL('vCursor', 'gray24', 'bred', 'none')
call s:HL('iCursor', 'gray24', 'bred', 'none')
" }}}

" Syntax highlighting {{{
call s:HL('Special', 'nyellow', 'none', 'none')

call s:HL('MatchParen', 'vhcontrast', 'lcontrast', 'bold')

call s:HL('Comment', 'gray12', 'none', 'none')
call s:HL('Todo', 'gray12', 'none', 'none')
call s:HL('SpecialComment', 'gray12', 'none', 'bold')

call s:HL('Statement', 'hcontrast', 'none', 'bold')
call s:HL('Keyword', 'hcontrast', 'none', 'bold')
call s:HL('Conditional', 'hcontrast', 'none', 'bold')
call s:HL('Operator', 'hcontrast', 'none', 'bold')
call s:HL('Label', 'hcontrast', 'none', 'bold')
call s:HL('Repeat', 'hcontrast', 'none', 'bold')

call s:HL('Identifier', 'none', 'none', 'none')
call s:HL('Function', 'nred', 'none', 'none')

call s:HL('PreProc', 'nyellow', 'none', 'none')
call s:HL('Macro', 'nyellow', 'none', 'none')
call s:HL('Define', 'nyellow', 'none', 'none')
call s:HL('PreCondit', 'nyellow', 'none', 'none')

call s:HL('Constant', 'ncyan', 'none', 'none')
call s:HL('Character', 'ncyan', 'none', 'none')
call s:HL('Boolean', 'ncyan', 'none', 'none')

call s:HL('Number', 'ncyan', 'none', 'none')
call s:HL('Float', 'ncyan', 'none', 'none')

call s:HL('String', 'ngreen', 'none', 'none')

call s:HL('SpecialChar', 'nyellow', 'none', 'none')

call s:HL('Type', 'nblue', 'none', 'none')
call s:HL('StorageClass', 'ncyan', 'none', 'none')
call s:HL('Structure', 'nred', 'none', 'none')
call s:HL('Typedef', 'nmagenta', 'none', 'none')

call s:HL('Exception', 'ngreen', 'none', 'bold')

call s:HL('Error', 'gray24', 'bred', 'bold')
call s:HL('Debug', 'gray24', 'none', 'bold')
call s:HL('Ignore', 'gray12', 'none', 'none')
" }}}

" Help {{{
call s:HL('helpHyperTextEntry', 'nred', 'none', 'none')
call s:HL('helpSectionDelim', 'nred', 'none', 'none')
call s:HL('helpSpecial', 'nblue', 'none', 'none')
call s:HL('helpExample', 'nmagenta', 'none', 'none')
" }}}

" Diffs {{{
call s:HL('DiffDelete', 'nred', 'bred', 'none')
call s:HL('DiffAdd', 'ngreen', 'bgreen', 'none')
call s:HL('DiffChange', 'nblue', 'bblue', 'none')
call s:HL('DiffText', 'gray24', 'nblue', 'none')

" Netrw {{{
call s:HL('netrwSymLink', 'ncyan', 'none', 'none')
call s:HL('netrwClassify', 'none', 'none', 'none')
call s:HL('netrwCmdSep', 'none', 'none', 'none')
" }}}

" Spelling {{{
if has("spell")
    call s:HL('SpellCap', 'nyellow', 'none', 'none')
    call s:HL('SpellBad', 'none', 'none', 'underline')
    call s:HL('SpellLocal', 'none', 'none', 'undercurl', 'nyellow')
    call s:HL('SpellRare', 'none', 'none', 'undercurl', 'nyellow')
endif
" }}}

" quickfix {{{
call s:HL('qfFilename', 'nmagenta', 'none', 'none')
call s:HL('qfSeparator', 'none', 'none', 'none')
call s:HL('qfLineNr', 'bmagenta', 'none', 'none')
" }}}

" }}}

" Plugins {{{

" CtrlP {{{
call s:HL('CtrlPMatch', 'hcontrast', 'none', 'bold')
call s:HL('CtrlPLinePre', 'gray12', 'none', 'none')
call s:HL('CtrlPPrtBase', 'gray12', 'none', 'none')
call s:HL('CtrlPPrtText', 'none', 'none', 'none')
call s:HL('CtrlPPrtCursor', 'gray24', 'gray18', 'none')
call s:HL('CtrlPNoEntries', 'gray24', 'bred', 'none')
call s:HL('CtrlPMode1', 'gray20', 'gray06', 'none')
call s:HL('CtrlPMode2', 'gray20', 'gray06', 'none')
call s:HL('CtrlPStats', 'gray00', 'gray18', 'none')
" }}}

" EasyMotion {{{
call s:HL('EasyMotionTarget', 'nblue', 'none', 'bold')
call s:HL('EasyMotionShade', 'gray12', 'none', 'none')
" }}}

" ShowMarks {{{
call s:HL('IndentGuidesOdd', 'gray12', 'none', 'none')
call s:HL('IndentGuidesEven', 'gray00', 'gray06', 'none')
" }}}

" TagBar {{{
call s:HL('TagBarScope', 'nmagenta', 'none', 'none')
call s:HL('TagBarKind', 'nred', 'none', 'none')
call s:HL('TagBarNestedKind', 'nred', 'none', 'none')
call s:HL('TagBarType', 'bmagenta', 'none', 'none')
call s:HL('TagBarFoldIcon', 'gray12', 'none', 'none')
call s:HL('TagBarVisibilityPublic', 'ngreen', 'none', 'none')
call s:HL('TagBarVisibilityProtected', 'nyellow', 'none', 'none')
call s:HL('TagBarVisibilityPrivate', 'nred', 'none', 'none')
" }}}

" }}}

" Filetype-specific {{{

" CSS {{{
call s:HL('cssVendor', 'hcontrast', 'none', 'none')
call s:HL('cssProp', 'hcontrast', 'none', 'bold')
call s:HL('cssFontAttr', 'hcontrast', 'none', 'bold')
call s:HL('cssAttrComma', 'none', 'none', 'none')
call s:HL('cssAttr', 'ncyan', 'none', 'none')
call s:HL('cssAttributeSelector', 'none', 'none', 'none')
call s:HL('cssInclude', 'none', 'none', 'none')
call s:HL('cssIncludeKeyword', 'none', 'none', 'none')
call s:HL('cssUnitDecorators', 'ncyan', 'none', 'none')
call s:HL('cssColor', 'ncyan', 'none', 'none')
call s:HL('cssBraces', 'none', 'none', 'none')
call s:HL('cssSelectorOp', 'none', 'none', 'none')
call s:HL('cssSelectorOp2', 'none', 'none', 'none')
call s:HL('cssIdentifier', 'nred', 'none', 'none')
call s:HL('cssClassName', 'nred', 'none', 'none')
call s:HL('cssClassNameDot', 'nred', 'none', 'none')
call s:HL('cssFunctionName', 'nblue', 'none', 'none')
call s:HL('cssFunctionComma', 'none', 'none', 'none')
call s:HL('cssTagName', 'nblue', 'none', 'none')
call s:HL('cssPseudoClassId', 'none', 'none', 'none')
call s:HL('cssPseudoClassFn', 'nblue', 'none', 'none')
" }}}

" javascript {{{
call s:HL('javaScriptIdentifier', 'vhcontrast', 'none', 'bold')
call s:HL('javaScriptBoolean', 'nred', 'none', 'none')
call s:HL('javaScriptFunction', 'vhcontrast', 'none', 'bold')
call s:HL('javaScriptBraces', 'none', 'none', 'none')
call s:HL('javaScriptMember', 'ngreen', 'none', 'none')
" }}}

" Diff {{{
call s:HL('gitDiff', 'gray12', 'none',)
call s:HL('diffRemoved', 'nred', 'none',)
call s:HL('diffAdded', 'ngreen', 'none',)
call s:HL('diffFile', 'nyellow', 'none', 'none')
call s:HL('diffNewFile', 'nyellow', 'none', 'none')
call s:HL('diffLine', 'nyellow', 'none', 'none')
call s:HL('diffSubname', 'byellow', 'none', 'none')
" }}}

" HTML {{{
call s:HL('htmlTag', 'none', 'none', 'none')
call s:HL('htmlEndTag', 'none', 'none', 'none')
call s:HL('htmlTagName', 'nred', 'none', 'none')
call s:HL('htmlTagN', 'none', 'none', 'none')
call s:HL('htmlItalic', 'none', 'none', 'none')
call s:HL('htmlBold', 'none', 'none', 'none')
call s:HL('htmlSpecialTagName', 'nred', 'none', 'none')
call s:HL('htmlSpecialChar', 'nred', 'none', 'none')
call s:HL('htmlArg', 'nblue', 'none', 'none')
call s:HL('htmlTitle', 'none', 'none', 'none')
call s:HL('htmlH1', 'none', 'none', 'none')
call s:HL('htmlH2', 'none', 'none', 'none')
call s:HL('htmlH3', 'none', 'none', 'none')
call s:HL('htmlH4', 'none', 'none', 'none')
call s:HL('htmlH5', 'none', 'none', 'none')
call s:HL('htmlH6', 'none', 'none', 'none')
call s:HL('htmlLink', 'none', 'none', 'none')
call s:HL('htmlError', 'none', 'none', 'none')
call s:HL('htmlString', 'ngreen', 'none', 'none')
call s:HL('javaScript', 'none', 'none', 'none')
call s:HL('javaScriptMember', 'none', 'none', 'none')
" }}} 

" Java {{{
call s:HL('javaClassDecl', 'nmagenta', 'none', 'none')
call s:HL('javaScopeDecl', 'none', 'none', 'bold')
call s:HL('javaCommentTitle', 'gray12', 'none', 'none')
call s:HL('javaDocTags', 'gray12', 'none', 'none')
call s:HL('javaDocParam', 'none', 'none', 'none')
call s:HL('javaStorageClass', 'nred', 'none', 'none')
call s:HL('javaAnnotation', 'ngreen', 'none', 'none')
call s:HL('javaTypedef', 'ncyan', 'none', 'none')
call s:HL('javaType', 'nblue', 'none', 'none')
call s:HL('javaBraces', 'none', 'none', 'none')
call s:HL('javaExternal', 'ngreen', 'none', 'none')
call s:HL('javaSpecialChar', 'ngreen', 'none', 'none')
" }}}

" Vimscript {{{
call s:HL('VimMapModKey', 'vhcontrast', 'none', 'bold')
call s:HL('VimCommand', 'vhcontrast', 'none', 'bold')
call s:HL('VimCommentTitle', 'gray12', 'none', 'bold')
call s:HL('VimMapMod', 'none', 'none', 'none')
call s:HL('VimNotation', 'none', 'none', 'none')
call s:HL('VimBracket', 'none', 'none', 'none')
call s:HL('VimParenSep', 'none', 'none', 'none')
call s:HL('VimOption', 'nblue', 'none', 'none')
call s:HL('vimLineComment', 'gray12', 'none', 'none')
" }}}

" sh {{{
call s:HL('shDerefSimple', 'none', 'none', 'none')
call s:HL('shFunctionKey', 'none', 'none', 'bold')
call s:HL('shFunction', 'nmagenta', 'none', 'none')
call s:HL('shCommandSub', 'none', 'none', 'none')
call s:HL('shCmdSubRegion', 'ngreen', 'none', 'none')
call s:HL('shSpecial', 'none', 'none', 'none')
call s:HL('shDeref', 'none', 'none', 'none')
" }}}

" zsh {{{
call s:HL('zshDeref', 'nblue', 'none', 'none')
call s:HL('zshQuoted', 'ngreen', 'none', 'none')
call s:HL('zshPrecommand', 'nred', 'none', 'none')
call s:HL('zshTypes', 'none', 'none', 'none')
call s:HL('zshSubst', 'nblue', 'none', 'none')
" }}}

" LaTeX {{{
call s:HL('texStatement', 'hcontrast', 'none', 'bold')
call s:HL('texZone', 'hcontrast', 'none', 'none')
call s:HL('texMathZoneX', 'byellow', 'none', 'none')
call s:HL('texMathZoneA', 'byellow', 'none', 'none')
call s:HL('texMathZoneB', 'byellow', 'none', 'none')
call s:HL('texMathZoneC', 'byellow', 'none', 'none')
call s:HL('texMathZoneD', 'byellow', 'none', 'none')
call s:HL('texMathZoneE', 'byellow', 'none', 'none')
call s:HL('texMathZoneV', 'byellow', 'none', 'none')
call s:HL('texMathZoneX', 'byellow', 'none', 'none')
call s:HL('texMath', 'byellow', 'none', 'none')
call s:HL('texMathMatcher', 'byellow', 'none', 'none')
call s:HL('texRefLabel', 'byellow', 'none', 'none')
call s:HL('texRefZone', 'ngreen', 'none', 'none')
call s:HL('texSection', 'nred', 'none', 'none')
call s:HL('texComment', 'gray12', 'none', 'none')
call s:HL('texDelimiter', 'nblue', 'none', 'none')
call s:HL('Delimiter', 'nblue', 'none', 'none')
call s:HL('texMathZoneX', 'nmagenta', 'none', 'none')
call s:HL('texSpecialChar', 'ngreen', 'none', 'none')
augroup trafficlights_tex
    au!
    au BufRead,BufNewFile *.tex syn region texMathZoneV start="\\(" end="\\)\|%stopzone\>" keepend contains=@texMathZoneGroup
    au BufRead,BufNewFile *.tex syn region texMathZoneX start="\$" skip="\\\\\|\\\$" end="\$\|%stopzone\>" keepend contains=@texMathZoneGroup
augroup END
" }}}

" Markdown {{{
call s:HL('markdownHeadingRule', 'acontrast', 'none', 'none')
call s:HL('markdownRule', 'acontrast', 'none', 'none')
call s:HL('markdownHeadingDelimiter', 'acontrast', 'none', 'none')
call s:HL('markdownOrderedListMarker', 'acontrast', 'none', 'none')
call s:HL('markdownListMarker', 'acontrast', 'none', 'none')
call s:HL('markdownBlockQuote', 'acontrast', 'none', 'none')
call s:HL('markdownItalic', 'nyellow', 'none', 'none')
call s:HL('markdownBold', 'nyellow', 'none', 'none')
call s:HL('markdownH1', 'vhcontrast', 'none', 'bold')
call s:HL('markdownH2', 'vhcontrast', 'none', 'bold')
call s:HL('markdownH3', 'vhcontrast', 'none', 'bold')
call s:HL('markdownH4', 'vhcontrast', 'none', 'bold')
call s:HL('markdownH5', 'vhcontrast', 'none', 'bold')
call s:HL('markdownH6', 'vhcontrast', 'none', 'bold')
call s:HL('markdownLinkText', 'ncyan', 'none', 'none')
call s:HL('markdownIdDeclaration', 'nmagenta')
call s:HL('markdownAutomaticLink', 'nblue', 'none', 'none')
call s:HL('markdownUrl', 'nblue', 'none', 'none')
call s:HL('markdownUrldelimiter', 'gray12', 'none', 'none')
call s:HL('markdownLinkTextDelimiter', 'gray12', 'none', 'none')
call s:HL('markdownCodeDelimiter', 'nmagenta', 'none', 'none')
call s:HL('markdownCode', 'nmagenta', 'none', 'none')
call s:HL('markdownCodeBlock', 'nmagenta', 'none', 'none')
" }}}

" Python {{{
call s:HL('pythonBuiltin', 'nblue')
call s:HL('pythonBuiltinObj', 'nblue')
call s:HL('pythonBuiltinFunc', 'nblue')
call s:HL('pythonFunction', 'nred')
call s:HL('pythonEscape', 'nblue')
call s:HL('pythonException', 'ngreen', 'none', 'none')
call s:HL('pythonExceptions', 'ngreen', 'none', 'none')
call s:HL('pythonPrecondit', 'ngreen', 'none', 'none')
call s:HL('pythonInclude', 'hcontrast', 'none', 'bold')
call s:HL('pythonString', 'ngreen', 'none', 'none')
call s:HL('pythonDecorator', 'ngreen', 'none', 'none')
call s:HL('pythonRun', 'gray12', 'none', 'bold')
" call s:HL('pythonRepeat', 'gray18', 'none', 'bold')
call s:HL('pythonCoding', 'gray12', 'none', 'bold')
" }}}

" Ruby {{{
call s:HL('rubyBlock', 'hcontrast', 'none', 'bold')
call s:HL('rubyClass', 'hcontrast', 'none', 'bold')
call s:HL('rubyModule', 'hcontrast', 'none', 'bold')
call s:HL('rubyInclude', 'none', 'none', 'none')
call s:HL('rubyDefine', 'hcontrast', 'none', 'bold')
call s:HL('rubyRegexp', 'nmagenta', 'none', 'none')
call s:HL('rubyRegexpCharClass', 'nmagenta', 'none', 'none')
call s:HL('rubyRegexpAnchor', 'nmagenta', 'none', 'none')
call s:HL('rubyRegexpQuantifier', 'nmagenta', 'none', 'none')
call s:HL('rubyRegexpDelimiter', 'nmagenta', 'none', 'none')
call s:HL('rubyStringDelimiter', 'ngreen', 'none', 'none')
call s:HL('rubyString', 'ngreen', 'none', 'none')
call s:HL('rubyTodo', 'acontrast', 'vlcontrast', 'bold')
call s:HL('rubyPseudoVariable', 'nblue', 'none', 'none')
call s:HL('rubySymbol', 'nyellow', 'none', 'none')
call s:HL('rubyBlockParameter', 'nyellow', 'none', 'none')
call s:HL('rubyInstanceVariable', 'nyellow', 'none', 'none')
call s:HL('rubyModuleDeclaration', 'nred', 'none', 'none')
call s:HL('rubyConstant', 'nred', 'none', 'none')
call s:HL('rubyAccess', 'hcontrast', 'none', 'bold')
call s:HL('rubyAttribute', 'vhcontrast', 'none', 'bold')
" }}}

" Clojure {{{
call s:HL('clojureSpecial', 'nred', 'none', 'none')
call s:HL('clojureDefn', 'nred', 'none', 'none')
call s:HL('clojureDefMacro', 'nred', 'none', 'none')
call s:HL('clojureDefine', 'nred', 'none', 'none')
call s:HL('clojureMacro', 'nred', 'none', 'none')
call s:HL('clojureCond', 'nred', 'none', 'none')
call s:HL('clojureKeyword', 'byellow', 'none', 'none')
call s:HL('clojureFunc', 'bmagenta', 'none', 'none')
call s:HL('clojureRepeat', 'bmagenta', 'none', 'none')
call s:HL('clojureParen0', 'gray12', 'none', 'none')
call s:HL('clojureAnonArg', 'none', 'none', 'none')
" }}}

" Django Templates {{{
call s:HL('djangoArgument', 'byellow', 'none', 'none')
call s:HL('djangoTagBlock', 'byellow', 'none', 'none')
call s:HL('djangoVarBlock', 'byellow', 'none', 'none')
" }}}

" LessCSS {{{
call s:HL('lessVariable', 'ngreen', 'none', 'none')
" }}}

" }}}

" }}}

