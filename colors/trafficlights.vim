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
if &background == 'dark'

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
    let s:bwc.gray12  = ['#767676', 244] "
    let s:bwc.gray11  = ['#c6c6c6', 243]
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

    let s:bwc.nyellow  = ['#ffd757', 221]
    let s:bwc.byellow  = ['#ff8700', 208]
    let s:bwc.ngreen   = ['#5faf00', 70]
    let s:bwc.bgreen   = ['#005f00', 22]
    let s:bwc.nblue    = ['#5f87ff', 69]
    let s:bwc.bblue    = ['#0000ff', 21]
    let s:bwc.nred     = ['#ff5f87', 204]
    let s:bwc.bred     = ['#af005f', 125]
    let s:bwc.nmagenta = ['#875fff', 99]
    let s:bwc.bmagenta = ['#af5fd7', 134]
    let s:bwc.ncyan    = ['#5fafd7', 74]
    let s:bwc.bcyan    = ['#5fd7d7', 80]

    let s:bwc.background       = ['#1a1a1a', 232]

else
    let s:bwc.gray00  = ['#ffffff', 231]
    let s:bwc.gray01  = ['#eeeeee', 255]
    let s:bwc.gray02  = ['#e4e4e4', 254] "
    let s:bwc.gray03  = ['#dadada', 253] "
    let s:bwc.gray04  = ['#d0d0d0', 252]
    let s:bwc.gray05  = ['#c6c6c6', 251]
    let s:bwc.gray06  = ['#bcbcbc', 250]
    let s:bwc.gray07  = ['#b2b2b2', 249]
    let s:bwc.gray08  = ['#a8a8a8', 248] "
    let s:bwc.gray09  = ['#9e9e9e', 247]
    let s:bwc.gray10  = ['#949494', 246] "
    let s:bwc.gray11  = ['#8a8a8a', 245]
    let s:bwc.gray12  = ['#767676', 244] "
    let s:bwc.gray13  = ['#c6c6c6', 243]
    let s:bwc.gray14  = ['#6c6c6c', 242]
    let s:bwc.gray15  = ['#626262', 241]
    let s:bwc.gray16  = ['#585858', 240] "
    let s:bwc.gray17  = ['#4e4e4e', 239]
    let s:bwc.gray18  = ['#444444', 238]
    let s:bwc.gray19  = ['#3a3a3a', 237] "
    let s:bwc.gray20  = ['#303030', 236]
    let s:bwc.gray21  = ['#262626', 235]
    let s:bwc.gray22  = ['#1c1c1c', 234] "
    let s:bwc.gray23  = ['#121212', 233]
    let s:bwc.gray24  = ['#080808', 232]

    let s:bwc.nyellow  = ['#d75f00', 208]
    let s:bwc.byellow  = ['#ffaf00', 214]
    let s:bwc.ngreen   = ['#008700', 28]
    let s:bwc.bgreen   = ['#afffaf', 157]
    let s:bwc.nblue    = ['#0000ff', 21]
    let s:bwc.bblue    = ['#5f87ff', 69]
    let s:bwc.nred     = ['#87005f', 89]
    let s:bwc.bred     = ['#ffafaf', 217]
    let s:bwc.nmagenta = ['#5f00d7', 56]
    let s:bwc.bmagenta = ['#8700d7', 92]
    let s:bwc.ncyan    = ['#005f87', 24]
    let s:bwc.bcyan    = ['#5fd7d7', 80]

    let s:bwc.background       = ['#f2f2f2', 232]
endif
" }}}

" Highlighting Function {{{
function! s:HL(group, fg, ...)
    " Arguments: group, guifg, guibg, gui, guisp

    let histring = 'hi ' . a:group . ' '

    if strlen(a:fg)
        if a:fg == 'fg'
            let histring .= 'guifg=fg ctermfg=fg '
        elseif a:fg == 'none'
            let histring .= 'guifg=NONE ctermfg=NONE '
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
    call s:HL('Normal', 'gray17', '', 'none')
endif

call s:HL('Folded', 'gray06', 'none', 'none')
call s:HL('VertSplit', 'gray12', 'none', 'none')

call s:HL('CursorLine', 'none', 'gray03', 'none')
    
call s:HL('CursorColumn', 'none', 'gray03', 'none')
call s:HL('ColorColumn', 'none', 'gray01', 'none')

call s:HL('TabLine', 'gray00', 'gray06', 'none')
call s:HL('TabLineFill', 'gray18', 'none', 'none')
call s:HL('TabLineSel', 'gray00', 'gray12', 'none')

call s:HL('NonText', 'gray06', 'none', 'none')
call s:HL('SpecialKey', 'gray12', 'none', 'none')

call s:HL('Visual', 'fg', 'gray06', 'none')
call s:HL('VisualNOS', 'fg', 'gray06', 'none')

call s:HL('Search', 'gray00', 'gray12', 'none')
call s:HL('IncSearch', 'gray00', 'nyellow', 'none')
call s:HL('Underlined', 'none', 'none', 'underline')

call s:HL('Directory', 'nblue', 'none', 'none')

call s:HL('Title', 'ngreen')

call s:HL('ErrorMsg', 'nred', 'none', 'none')
call s:HL('MoreMsg', 'nyellow', 'none', 'none')
call s:HL('ModeMsg', 'ngreen', 'none', 'none')
call s:HL('Question', 'nblue', 'none', 'none')
call s:HL('WarningMsg', 'nmagenta', 'none', 'none')

call s:HL('WildMenu', 'gray24', 'gray06', 'none')

call s:HL('Tag', 'none', 'none', 'bold')

if &background == 'dark'
    call s:HL('StatusLine', 'gray00', 'gray18', 'none')
    call s:HL('StatusLineNC', 'gray00', 'gray12', 'none')
    call s:HL('User1', 'gray18', 'gray06', 'none')
    call s:HL('User2', 'gray24', 'none', 'none')
    call s:HL('User3', 'gray24', 'none', 'none' )
    call s:HL('User4', 'gray24', 'none', 'none')
    call s:HL('User5', 'gray24', 'none', 'none')
    call s:HL('User6', 'gray24', 'none', 'none')
    call s:HL('User7', 'gray24', 'none', 'none')
    call s:HL('User8', 'gray24', 'none', 'none')
    call s:HL('User9', 'gray24', 'none', 'none')
    call s:HL('User0', 'gray24', 'none', 'none')
else
    call s:HL('StatusLine', 'gray24', 'gray06', 'none')
    call s:HL('StatusLineNC', 'gray24', 'gray12', 'none')
    call s:HL('User1', 'gray06', 'gray18', 'none')
    call s:HL('User2', 'gray24', 'none', 'none')
    call s:HL('User3', 'gray24', 'none', 'none' )
    call s:HL('User4', 'gray24', 'none', 'none')
    call s:HL('User5', 'gray24', 'none', 'none')
    call s:HL('User6', 'gray24', 'none', 'none')
    call s:HL('User7', 'gray24', 'none', 'none')
    call s:HL('User8', 'gray24', 'none', 'none')
    call s:HL('User9', 'gray24', 'none', 'none')
    call s:HL('User0', 'gray24', 'none', 'none')
endif
" }}}

" Gutter {{{
if &background == 'dark'
    call s:HL('CursorLineNr', 'gray00', 'nyellow', 'none')
    call s:HL('LineNr', 'gray06', 'none', 'none')
    call s:HL('FoldColumn', 'gray06', 'none', 'none')
else
    call s:HL('CursorLineNr', 'gray24', 'byellow', 'none')
    call s:HL('LineNr', 'gray06', 'none', 'none')
    call s:HL('FoldColumn', 'gray06', 'none', 'none')
endif
call s:HL('SignColumn', 'none', 'none', 'none')
" }}}

" Completion Menu {{{
if &background == 'dark'
    call s:HL('Pmenu', 'gray00', 'gray18', 'none')
    call s:HL('PmenuSel', 'gray24', 'gray06', 'none')
    call s:HL('PmenuSbar', 'none', 'gray18', 'none')
    call s:HL('PmenuThumb', 'gray06', 'gray06', 'none')
else 
    call s:HL('Pmenu', 'gray24', 'gray06', 'none')
    call s:HL('PmenuSel', 'gray00', 'gray18', 'none')
    call s:HL('PmenuSbar', 'none', 'gray06', 'none')
    call s:HL('PmenuThumb', 'gray18', 'gray18', 'none')
endif
" }}}

" Cursor {{{
call s:HL('Cursor', 'gray24', 'bred', 'none')
call s:HL('vCursor', 'gray24', 'bred', 'none')
call s:HL('iCursor', 'gray24', 'bred', 'none')
" }}}

" Syntax highlighting {{{
call s:HL('Special', 'ngreen', 'none', 'none')

call s:HL('MatchParen', 'gray24', 'gray06', 'bold')

call s:HL('Comment', 'gray12', 'none', 'none')
call s:HL('Todo', 'gray12', 'none', 'none')
call s:HL('SpecialComment', 'gray24', 'none', 'bold')

call s:HL('Statement', 'gray18', 'none', 'bold')
call s:HL('Keyword', 'gray18', 'none', 'bold')
call s:HL('Conditional', 'gray18', 'none', 'bold')
call s:HL('Operator', 'gray18', 'none', 'bold')
call s:HL('Label', 'gray18', 'none', 'bold')
call s:HL('Repeat', 'gray18', 'none', 'bold')

call s:HL('Identifier', 'fg', 'none', 'none')
call s:HL('Function', 'nred', 'none', 'none')

call s:HL('PreProc', 'bmagenta', 'none', 'none')
call s:HL('Macro', 'ngreen', 'none', 'none')
call s:HL('Define', 'ngreen', 'none', 'none')
call s:HL('PreCondit', 'ngreen', 'none', 'none')

call s:HL('Constant', 'nblue', 'none', 'none')
call s:HL('Character', 'nmagenta', 'none', 'none')
call s:HL('Boolean', 'nmagenta', 'none', 'none')

call s:HL('Number', 'ncyan', 'none', 'none')
call s:HL('Float', 'ncyan', 'none', 'none')

call s:HL('String', 'nmagenta', 'none', 'none')

call s:HL('SpecialChar', 'bmagenta', 'none', 'none')

call s:HL('Type', 'nblue', 'none', 'none')
call s:HL('StorageClass', 'nred', 'none', 'none')
call s:HL('Structure', 'nred', 'none', 'none')
call s:HL('Typedef', 'nred', 'none', 'none')

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
if &background == 'dark'
    call s:HL('DiffText', 'gray24', 'nblue', 'none')
else
    call s:HL('DiffText', 'gray00', 'nblue', 'none')
endif
" }}}

" Netrw {{{
call s:HL('netrwSymLink', 'ncyan', 'none', 'none')
call s:HL('netrwClassify', 'fg', 'none', 'none')
call s:HL('netrwCmdSep', 'fg', 'none', 'none')
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
call s:HL('CtrlPNoEntries', 'gray00', 'nred', 'none')
call s:HL('CtrlPMatch', 'gray24', 'gray03', 'none')
call s:HL('CtrlPLinePre', 'gray12', 'none', 'none')
call s:HL('CtrlPPrtBase', 'gray12', 'none', 'none')
call s:HL('CtrlPPrtText', 'fg', 'none', 'none')
call s:HL('CtrlPPrtCursor', 'gray24', 'gray18', 'none')
if &background == 'dark'
    call s:HL('CtrlPMode1', 'gray24', 'gray06', 'none')
    call s:HL('CtrlPMode2', 'gray00', 'gray12', 'none')
    call s:HL('CtrlPStats', 'gray00', 'gray12', 'none')
else
    call s:HL('CtrlPMode1', 'gray00', 'gray18', 'none')
    call s:HL('CtrlPMode2', 'gray24', 'gray06', 'none')
    call s:HL('CtrlPStats', 'gray24', 'gray06', 'none')
endif
" }}}

" EasyMotion {{{
call s:HL('EasyMotionTarget', 'nblue', 'none', 'bold')
call s:HL('EasyMotionShade', 'gray06', 'none', 'none')
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
call s:HL('cssProp', 'gray18', 'none', 'bold')
call s:HL('cssAttrComma', 'gray18', 'none', 'none')
call s:HL('cssFontAttr', 'gray18', 'none', 'bold')
call s:HL('cssAttr', 'ncyan', 'none', 'none')
call s:HL('cssUnitDecorators', 'ncyan', 'none', 'none')
call s:HL('cssColor', 'ncyan', 'none', 'none')
call s:HL('cssBraces', 'fg', 'none', 'none')
call s:HL('cssSelectorOp', 'fg', 'none', 'none')
call s:HL('cssSelectorOp2', 'fg', 'none', 'none')
call s:HL('cssIdentifier', 'nred', 'none', 'none')
call s:HL('cssClassName', 'bmagenta', 'none', 'none')
call s:HL('cssTagName', 'nblue', 'none', 'none')
call s:HL('cssClassNameDot', 'bmagenta', 'none', 'none')
call s:HL('cssPseudoClassId', 'fg', 'none', 'none')
" }}}

" javascript {{{
call s:HL('javaScriptIdentifier', 'nmagenta', 'none', 'none')
call s:HL('javaScriptBoolean', 'nred', 'none', 'none')
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
call s:HL('htmlTag', 'fg', 'none', 'none')
call s:HL('htmlEndTag', 'fg', 'none', 'none')
call s:HL('htmlTagName', 'nred', 'none', 'none')
call s:HL('htmlTagN', 'fg', 'none', 'none')
call s:HL('htmlSpecialTagName', 'ngreen', 'none', 'none')
call s:HL('htmlSpecialChar', 'nred', 'none', 'none')
call s:HL('htmlArg', 'ncyan', 'none', 'none')
call s:HL('htmlTitle', 'fg', 'none', 'none')
call s:HL('htmlH1', 'fg', 'none', 'none')
call s:HL('htmlH2', 'fg', 'none', 'none')
call s:HL('htmlH3', 'fg', 'none', 'none')
call s:HL('htmlH4', 'fg', 'none', 'none')
call s:HL('htmlH5', 'fg', 'none', 'none')
call s:HL('htmlH6', 'fg', 'none', 'none')
call s:HL('htmlLink', 'fg', 'none', 'none')
" }}} 

" Java {{{
call s:HL('javaClassDecl', 'nmagenta', 'none', 'none')
call s:HL('javaScopeDecl', 'fg', 'none', 'bold')
call s:HL('javaCommentTitle', 'gray12', 'none', 'none')
call s:HL('javaDocTags', 'gray12', 'none', 'none')
call s:HL('javaDocParam', 'gray18', 'none', 'none')
call s:HL('javaStorageClass', 'nred', 'none', 'none')
call s:HL('javaAnnotation', 'ngreen', 'none', 'none')
call s:HL('javaTypedef', 'ncyan', 'none', 'none')
call s:HL('javaType', 'nblue', 'none', 'none')
call s:HL('javaBraces', 'fg', 'none', 'none')
call s:HL('javaExternal', 'bmagenta', 'none', 'none')
call s:HL('javaSpecialChar', 'ngreen', 'none', 'none')
" }}}

" Vim {{{
call s:HL('VimCommentTitle', 'gray12', 'none', 'bold')
call s:HL('VimMapMod', 'fg', 'none', 'none')
call s:HL('VimMapModKey', 'gray18', 'none', 'bold')
call s:HL('VimNotation', 'fg', 'none', 'none')
call s:HL('VimCommand', 'gray18', 'none', 'bold')
call s:HL('VimBracket', 'fg', 'none', 'none')
call s:HL('VimParenSep', 'fg', 'none', 'none')
call s:HL('VimOption', 'nblue', 'none', 'none')
call s:HL('vimLineComment', 'gray12', 'none', 'none')
" }}}

" sh {{{
call s:HL('shDerefSimple', 'fg', 'none', 'none')
call s:HL('shFunctionKey', 'fg', 'none', 'bold')
call s:HL('shFunction', 'nmagenta', 'none', 'none')
call s:HL('shCommandSub', 'none', 'none', 'none')
call s:HL('shCmdSubRegion', 'ngreen', 'none', 'none')
call s:HL('shSpecial', 'fg', 'none', 'none')
call s:HL('shDeref', 'fg', 'none', 'none')
" }}}

" zsh {{{
call s:HL('zshDeref', 'nblue', 'none', 'none')
call s:HL('zshQuoted', 'ngreen', 'none', 'none')
call s:HL('zshPrecommand', 'nred', 'none', 'none')
call s:HL('zshTypes', 'fg', 'none', 'none')
call s:HL('zshSubst', 'nblue', 'none', 'none')
" }}}

" LaTeX {{{
call s:HL('texStatement', 'gray18', 'none', 'bold')
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
call s:HL('texZone', 'gray18', 'none', 'none')
call s:HL('texSpecialChar', 'ngreen', 'none', 'none')
augroup trafficlights_tex
    au!
    au BufRead,BufNewFile *.tex syn region texMathZoneV start="\\(" end="\\)\|%stopzone\>" keepend contains=@texMathZoneGroup
    au BufRead,BufNewFile *.tex syn region texMathZoneX start="\$" skip="\\\\\|\\\$" end="\$\|%stopzone\>" keepend contains=@texMathZoneGroup
augroup END
" }}}

" Markdown {{{
call s:HL('markdownHeadingRule', 'gray12', 'none', 'none')
call s:HL('markdownHeadingDelimiter', 'gray12', 'none', 'none')
call s:HL('markdownOrderedListMarker', 'gray12', 'none', 'none')
call s:HL('markdownListMarker', 'gray12', 'none', 'none')
call s:HL('markdownItalic', 'nyellow', 'none', 'none')
call s:HL('markdownBold', 'nyellow', 'none', 'none')
call s:HL('markdownH1', 'gray24', 'none', 'none')
call s:HL('markdownH2', 'gray18', 'none', 'none')
call s:HL('markdownH3', 'gray18', 'none', 'none')
call s:HL('markdownH4', 'gray18', 'none', 'none')
call s:HL('markdownH5', 'gray18', 'none', 'none')
call s:HL('markdownH6', 'gray18', 'none', 'none')
call s:HL('markdownLinkText', 'bmagenta', 'none', 'underline')
call s:HL('markdownIdDeclaration', 'nmagenta')
call s:HL('markdownAutomaticLink', 'nmagenta', 'none', 'none')
call s:HL('markdownUrl', 'nmagenta', 'none', 'none')
call s:HL('markdownUrldelimiter', 'gray12', 'none', 'none')
call s:HL('markdownLinkTextDelimiter', 'gray12', 'none', 'none')
call s:HL('markdownCodeDelimiter', 'ncyan', 'none', 'none')
call s:HL('markdownCode', 'nblue', 'none', 'none')
call s:HL('markdownCodeBlock', 'ncyan', 'none', 'none')
" }}}

" Python {{{
call s:HL('pythonBuiltin', 'nblue')
call s:HL('pythonBuiltinObj', 'nblue')
call s:HL('pythonBuiltinFunc', 'nblue')
call s:HL('pythonEscape', 'nblue')
call s:HL('pythonException', 'ngreen', 'none', 'none')
call s:HL('pythonExceptions', 'ngreen', 'none', 'none')
call s:HL('pythonPrecondit', 'ngreen', 'none', 'none')
call s:HL('pythonInclude', 'bmagenta', 'none', 'none')
call s:HL('pythonDecorator', 'ngreen', 'none', 'none')
call s:HL('pythonRun', 'gray12', 'none', 'bold')
call s:HL('pythonCoding', 'gray12', 'none', 'bold')
" }}}

" Ruby {{{
call s:HL('rubyBlock', 'gray18', 'none', 'bold')
call s:HL('rubyClass', 'gray18', 'none', 'bold')
call s:HL('rubyRegexp', 'ngreen', 'none', 'none')
call s:HL('rubyModule', 'gray18', 'none', 'bold')
call s:HL('rubyInclude', 'gray18', 'none', 'bold')
call s:HL('rubySymbol', 'nmagenta', 'none', 'none')
call s:HL('rubyDefine', 'gray18', 'none', 'bold')
call s:HL('rubyConstant', 'ncyan', 'none', 'none')
call s:HL('rubyPseudoVariable', 'nblue', 'none', 'none')
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
call s:HL('clojureAnonArg', 'gray18', 'none', 'bold')
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

