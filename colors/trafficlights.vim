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

set background=dark

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

let s:bwc.white    = ['ffffff', 231]
let s:bwc.gray255  = ['eeeeee', 255]
let s:bwc.gray252  = ['d0d0d0', 252]
let s:bwc.gray250  = ['bcbcbc', 250]
let s:bwc.gray245  = ['8a8a8a', 245]
let s:bwc.gray243  = ['767676', 243]
let s:bwc.gray241  = ['626262', 241]
let s:bwc.gray240  = ['585858', 240]
let s:bwc.gray239  = ['3a3a3a', 239]
let s:bwc.gray238  = ['3a3a3a', 238]
let s:bwc.gray237  = ['3a3a3a', 237]
let s:bwc.gray236  = ['303030', 236]
let s:bwc.gray235  = ['262626', 235]
let s:bwc.gray234  = ['1c1c1c', 234]
let s:bwc.gray233  = ['121212', 233]
let s:bwc.black    = ['000000', 232]

let s:bwc.nyellow  = ['ffcc66', 222]
let s:bwc.byellow  = ['ff0066', 220]
let s:bwc.ngreen   = ['66cc00', 112]
let s:bwc.bgreen   = ['00ff00', 22]
let s:bwc.nblue    = ['6666ff', 69]
let s:bwc.bblue    = ['0066cc', 25]
let s:bwc.nred     = ['ff6666', 203]
let s:bwc.bred     = ['ff0000', 197]
let s:bwc.nmagenta = ['9966ff', 99]
let s:bwc.bmagenta = ['cc66ff', 134]
let s:bwc.ncyan    = ['66ccff', 117]  "74 alt
let s:bwc.bcyan    = ['66ffff', 80]

let s:bwc.test    = ['66ffff', 242]
let s:bwc.test1    = ['66ffff', 238]
let s:bwc.nocol    = ['66ffff', 'none']
 
" let s:bwc.lightyellow     = ['ffcc66', 221]
" let s:bwc.byellow   = ['ffcc66', 222]
" let s:bwc.green           = ['8cffba', 121]
" let s:bwc.ngreen      = ['aeee00', 118]
" let s:bwc.nblue       = ['0a9dff', 69]
" let s:bwc.orange          = ['ffa724', 214]
" let s:bwc.red             = ['ff2c4b', 167]
" let s:bwc.nmagenta          = ['b88853', 99]
" let s:bwc.bmagenta     = ['ff9eb8', 212]
" let s:bwc.lightbrown      = ['c7915b', 173]
" let s:bwc.ncyan       = ['88633f', 95]


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
    let s:gutter = 'gray233'
else
    let s:gutter = 'nocol'
endif

if exists('g:trafficlights_tabline')
    if g:trafficlights_tabline == 0
        let s:tabline = 'gray233'
    elseif  g:trafficlights_tabline == 1
        let s:tabline = 'gray234'
    elseif  g:trafficlights_tabline == 2
        let s:tabline = 'gray235'
    elseif  g:trafficlights_tabline == 3
        let s:tabline = 'gray240'
    else
        let s:tabline = 'gray233'
    endif
else
    let s:tabline = 'gray234'
endif

" }}}

" Actual colorscheme ----------------------------------------------------------
" Vanilla Vim {{{

" General/UI {{{

" call 'hi Normal ctermbg=NONE'
call s:HL('Normal', 'gray250', '', 'none')

call s:HL('Folded', 'gray241', 'nocol', 'none')

call s:HL('VertSplit', 'gray235', 'nocol', 'none')
" call s:HL('VertSplit', 'gray245', 'nocol', 'none')

call s:HL('CursorLine',   '', 'gray234', 'none')
call s:HL('CursorColumn', '', 'gray234')
call s:HL('ColorColumn',  '', 'gray234')

call s:HL('TabLine', 'gray235', 'gray240', 'none')
call s:HL('TabLineFill', 'gray250', 'nocol', 'none')
call s:HL('TabLineSel', 'gray233', 'gray245', 'none')

call s:HL('MatchParen', 'gray252', 'gray240', 'bold')

call s:HL('NonText',    'gray237', 'nocol')
call s:HL('SpecialKey', 'gray237', 'nocol')

call s:HL('Visual',    '',  'gray237')
call s:HL('VisualNOS', '',  'gray237')

call s:HL('Search',    'black', 'nyellow', 'none')
call s:HL('IncSearch', 'black', 'byellow',    'none')

call s:HL('Underlined', 'nocol', '', 'underline')

call s:HL('StatusLine',   'gray233', 'gray245', 'none')
call s:HL('StatusLineNC', 'gray245', 'gray236', 'none')
call s:HL('User1', 'gray234', 'test', 'none')
" call s:HL('User1', 'nred', 'gray236', 'none')
call s:HL('User2', 'gray241', 'gray236', 'none')
call s:HL('User3', 'nyellow', 'gray236', 'none' )
call s:HL('User4', 'nblue', 'gray236', 'none')
call s:HL('User5', 'nmagenta', 'gray236', 'none')
call s:HL('User6', 'ncyan', 'gray236', 'none')
call s:HL('User7', 'gray250', 'gray235', 'none')
call s:HL('User8', 'white', 'nblue', 'none')
call s:HL('User9', 'white', 'nmagenta', 'none')
call s:HL('User0', 'white', 'gray240', 'none')

call s:HL('Directory', 'nblue', '', 'none')

call s:HL('Title', 'ngreen')

call s:HL('ErrorMsg', 'nred', 'nocol', 'none')
call s:HL('MoreMsg', 'nyellow', '', 'none')
call s:HL('ModeMsg', 'ngreen', '', 'none')
call s:HL('Question', 'nblue', '', 'none')
call s:HL('WarningMsg', 'nmagenta', '', 'none')

" This is a ctags tag, not an HTML one.  'Something you can use c-] on'.
call s:HL('Tag', '', '', 'bold')

" hi IndentGuides                  guibg=#373737
" hi WildMenu        guifg=#66D9EF guibg=#000000

" }}}
" Gutter {{{

call s:HL('CursorLineNr',     'gray245', s:gutter)
call s:HL('LineNr',     'gray235', s:gutter)
" call s:HL('LineNr',     'gray237', '', '')
" call 'hi SignColumn guifg=#000000 ctermfg=240 guibg=#000000 ctermbg=233 term=none'
" hi SignColumn guifg=#000000 ctermfg=140 guibg=#000000 ctermbg='' term=none
" call 'hi FoldColumn ctermfg=240 ctermbg=233'
call s:HL('SignColumn', 'nocol', 'nocol', '')
" hi SignColumn ctermbg=none
call s:HL('FoldColumn', 'gray241', 'nocol', '')

" }}}
" Cursor {{{

call s:HL('Cursor',  'black', 'nblue', 'bold')
call s:HL('vCursor', 'black', 'nblue', 'bold')
call s:HL('iCursor', 'black', 'nblue', 'none')

" }}}
" Syntax highlighting {{{

" Start with a simple base.
call s:HL('Special', 'ngreen')

" Comments are slightly brighter than folds, to make 'headers' easier to see.
call s:HL('Comment',        'gray243')
call s:HL('Todo',           'gray245', 'nocol', 'none')
call s:HL('SpecialComment', 'white', 'nocol', 'bold')

" Strings are a nice, pale straw color.  Nothing too fancy.
call s:HL('String', 'nyellow')

" Control flow stuff is nred.
call s:HL('Statement',   'gray250', '', 'bold')
call s:HL('Keyword',     'gray250', '', 'bold')
call s:HL('Conditional', 'gray250', '', 'bold')
call s:HL('Operator',    'gray250', '', 'bold')
call s:HL('Label',       'gray250', '', 'bold')
call s:HL('Repeat',      'gray250', '', 'bold')


" Functions and variable declarations are orange, because gray250 looks weird.
call s:HL('Identifier', 'gray250', '', 'none')
call s:HL('Function',   'nmagenta', '', 'none')

" Preprocessor stuff is ngreen, to make it pop.
"
" This includes imports in any given language, because they should usually be
" grouped together at the beginning of a file.  If they're in the middle of some
" other code they should stand out, because something tricky is
" probably going on.
call s:HL('PreProc',   'ngreen', '', 'none')
call s:HL('Macro',     'ngreen', '', 'none')
call s:HL('Define',    'ngreen', '', 'none')
call s:HL('PreCondit', 'ngreen', '', 'none')

" Constants of all kinds are colored together.
" I'm not really happy with the color yet...
call s:HL('Constant',  'nmagenta', '', 'none')
call s:HL('Character', 'nmagenta', '', 'none')
call s:HL('Boolean',   'nmagenta', '', 'none')

call s:HL('Number', 'nred', '', 'none')
call s:HL('Float',  'nred', '', 'none')

" Not sure what 'special character in a constant' means, but let's make it pop.
call s:HL('SpecialChar', 'bmagenta', '', 'none')

call s:HL('Type', 'bmagenta', '', 'none')
call s:HL('StorageClass', 'nred', '', 'none')
call s:HL('Structure', 'nred', '', 'none')
call s:HL('Typedef', 'nred', '', 'none')

" Make try/catch blocks stand out.
call s:HL('Exception', 'ngreen', '', 'bold')

" Misc
call s:HL('Error',  'white',   'bred', 'bold')
call s:HL('Debug',  'white',   '',      'bold')
call s:HL('Ignore', 'gray243', '',      '')

" }}}
" Completion Menu {{{

call s:HL('Pmenu', 'gray250', 'gray237')
call s:HL('PmenuSel', 'white', 'nred', 'none')
call s:HL('PmenuSbar', '', 'gray237')
call s:HL('PmenuThumb', 'gray252')

" }}}
" Diffs {{{

" call s:HL('DiffDelete', 'gray233', 'gray233')
" call s:HL('DiffAdd',    'gray250',     'gray237')
" call s:HL('DiffChange', '',     'gray237')
" call s:HL('DiffText',   'gray255', 'gray241', 'none')
" call s:HL('DiffDelete', 'gray233', 'gray233')
" call s:HL('DiffAdd',    '',     'gray235')
" call s:HL('DiffChange', '',     'gray235')
" call s:HL('DiffText',   'nocol', 'gray237', 'none')

call s:HL('DiffDelete', 'nred', 'bred')
call s:HL('DiffAdd',    'ngreen',     'bgreen')
call s:HL('DiffChange', 'nblue',     'bblue')
call s:HL('DiffText',   'gray255', 'nblue', 'none')

" }}}
" Netrw {{{

call s:HL('netrwSymLink', 'ncyan', '')
call s:HL('netrwClassify', 'gray250', '')

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
    call s:HL('CtrlPNoEntries', 'white', 'bred', 'none')

    " the matched pattern
    call s:HL('CtrlPMatch', 'nyellow', '', 'none')

    " the line prefix '>' in the match window
    call s:HL('CtrlPLinePre', 'gray240', 'nocol', 'none')

    " the prompt’s base
    call s:HL('CtrlPPrtBase', 'gray240', 'nocol', 'none')

    " the prompt’s text
    call s:HL('CtrlPPrtText', 'gray250', 'nocol', 'none')

    " the prompt’s cursor when moving over the text
    call s:HL('CtrlPPrtCursor', 'black', 'bblue', 'bold')

    " 'prt' or 'win', also for 'regex'
    call s:HL('CtrlPMode1', 'black', 'ngreen', 'bold')

    " 'file' or 'path', also for the local working dir
    call s:HL('CtrlPMode2', 'black', 'ngreen', 'bold')

    " the scanning status
    call s:HL('CtrlPStats', 'black', 'bblue', 'bold')

    " TODO: CtrlP extensions.
    " CtrlPTabExtra  : the part of each line that’s not matched against (Comment)
    " CtrlPqfLineCol : the line and column numbers in quickfix mode (|s:HL-Search|)
    " CtrlPUndoT     : the elapsed time in undo mode (|s:HL-Directory|)
    " CtrlPUndoBr    : the square brackets [] in undo mode (Comment)
    " CtrlPUndoNr    : the undo number inside [] in undo mode (String)

" }}}
" EasyMotion {{{

call s:HL('EasyMotionTarget', 'nblue',     'nocol', 'bold')
call s:HL('EasyMotionShade',  'gray240', 'nocol')

" }}}
" Interesting Words {{{

" These are only used if you're me or have copied the <leader>hNUM mappings
" from my Vimrc.
call s:HL('InterestingWord1', 'black', 'byellow')
call s:HL('InterestingWord2', 'black', 'ngreen')
call s:HL('InterestingWord3', 'black', 'bgreen')
call s:HL('InterestingWord4', 'black', 'nmagenta')
call s:HL('InterestingWord5', 'black', 'bmagenta')
call s:HL('InterestingWord6', 'black', 'nred')


" }}}
" Makegreen {{{

" hi GreenBar term=reverse ctermfg=white ctermbg=green guifg=black guibg=#9edf1c
" hi RedBar   term=reverse ctermfg=white ctermbg=red guifg=white guibg=#C50048

" }}}
" Rainbow Parentheses {{{

call s:HL('level16c', 'gray241',   '', 'bold')
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

call s:HL('ShowMarksHLl', 'nblue', 'gray233')
call s:HL('ShowMarksHLu', 'nblue', 'gray233')
call s:HL('ShowMarksHLo', 'nblue', 'gray233')
call s:HL('ShowMarksHLm', 'nblue', 'gray233')

" }}}
" ShowMarks {{{

call s:HL('IndentGuidesOdd', 'gray240', 'nocol')
call s:HL('IndentGuidesEven', 'gray250', 'gray234')

" }}}
" ShowMarks {{{

call s:HL('TagBarScope', 'nmagenta', '')
call s:HL('TagBarKind', 'nred', '')
call s:HL('TagBarNestedKind', 'nred', '')
call s:HL('TagBarType', 'bmagenta', '')
call s:HL('TagBarFoldIcon', 'gray243', '')
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

call s:HL('clojureParen0', 'gray245', '', 'none')

call s:HL('clojureAnonArg', 'white', '', 'bold')

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
call s:HL('cssBraces', 'gray245', '', 'none')
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

call s:HL('gitDiff', 'gray245', '',)

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
" call s:HL('htmlString',    'nmagenta', 'nocol', 'none')

" Punctuation
call s:HL('htmlTag',    'gray250', 'nocol', 'none')
call s:HL('htmlEndTag', 'gray250', 'nocol', 'none')

" Tag names
call s:HL('htmlTagName',        'nred', '', 'none')
call s:HL('htmlTagN',        'gray250', '', 'none')
call s:HL('htmlSpecialTagName', 'ngreen', '', 'none')
call s:HL('htmlSpecialChar',    'nred',   '', 'none')

" Attributes
call s:HL('htmlArg', 'gray250', '', 'none')

call s:HL('htmlTitle', 'nyellow', '', 'none')
call s:HL('htmlH1', 'nyellow', '', 'none')
call s:HL('htmlH2', 'nyellow', '', 'none')
call s:HL('htmlH3', 'nyellow', '', 'none')
call s:HL('htmlH4', 'nyellow', '', 'none')
call s:HL('htmlH5', 'nyellow', '', 'none')
call s:HL('htmlH6', 'nyellow', '', 'none')

" Stuff inside an <a> tag

if g:trafficlights_html_link_underline
    call s:HL('htmlLink', 'gray245', '', 'underline')
else
    call s:HL('htmlLink', 'gray250', '', 'none')
endif

" }}} 
" Java {{{

call s:HL('javaClassDecl', 'nmagenta', '', 'none')
call s:HL('javaScopeDecl', 'nmagenta', '', 'none')
call s:HL('javaCommentTitle', 'gray243', '')
call s:HL('javaDocTags', 'white', '', 'none')
call s:HL('javaDocParam', 'nyellow', '', '')
call s:HL('javaStorageClass', 'nmagenta', '', '')
call s:HL('javaAnnotation', 'nmagenta', '', '')
call s:HL('javaTypedef', 'ngreen', '', '')

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
call s:HL('texComment', 'gray243', '', 'none')
call s:HL('texDelimiter', 'byellow', '', 'none')
call s:HL('texZone', 'gray252', '', 'none')

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
call s:HL('mailHeader', 'gray245', '', '')
call s:HL('mailHeaderKey', 'gray245', '', '')
call s:HL('mailHeaderEmail', 'white', '', '')
call s:HL('mailURL', 'nmagenta', '', 'underline')
call s:HL('mailSignature', 'gray243', '', 'none')

call s:HL('mailQuoted1', 'gray243', '', 'none')
call s:HL('mailQuoted2', 'bmagenta', '', 'none')
call s:HL('mailQuoted3', 'byellow', '', 'none')
call s:HL('mailQuoted4', 'byellow', '', 'none')
call s:HL('mailQuoted5', 'ngreen', '', 'none')

" }}}
" Markdown {{{

call s:HL('markdownHeadingRule', 'gray245', '', 'none')
call s:HL('markdownHeadingDelimiter', 'gray245', '', 'none')
call s:HL('markdownOrderedListMarker', 'gray245', '', 'none')
call s:HL('markdownListMarker', 'gray245', '', 'none')
call s:HL('markdownItalic', 'nyellow', '', 'none')
call s:HL('markdownBold', 'nyellow', '', 'none')
call s:HL('markdownH1', 'white', '', 'none')
call s:HL('markdownH2', 'gray252', '', 'none')
call s:HL('markdownH3', 'gray250', '', 'none')
call s:HL('markdownH4', 'gray250', '', 'none')
call s:HL('markdownH5', 'gray250', '', 'none')
call s:HL('markdownH6', 'gray250', '', 'none')
call s:HL('markdownLinkText', 'bmagenta', '', 'underline')
call s:HL('markdownIdDeclaration', 'nmagenta')
call s:HL('markdownAutomaticLink', 'nmagenta', '', 'none')
call s:HL('markdownUrl', 'nmagenta', '', 'none')
call s:HL('markdownUrldelimiter', 'gray245', '', 'none')
" call s:HL('markdownLinkDelimiter', 'gray245', '', 'none')
call s:HL('markdownLinkTextDelimiter', 'gray245', '', 'none')
call s:HL('markdownCodeDelimiter', 'ncyan', '', 'none')
call s:HL('markdownCode', 'nblue', '', 'none')
call s:HL('markdownCodeBlock', 'ncyan', '', 'none')

" }}}
" MySQL {{{

call s:HL('mysqlSpecial', 'bmagenta', '', 'bold')

" }}}
" Python {{{

hi def link pythonOperator Operator
call s:HL('pythonBuiltin',     'bmagenta')
call s:HL('pythonBuiltinObj',  'bmagenta')
call s:HL('pythonBuiltinFunc', 'bmagenta')
call s:HL('pythonEscape',      'bmagenta')
call s:HL('pythonException',   'ngreen', '', 'bold')
call s:HL('pythonExceptions',  'ngreen', '', 'none')
call s:HL('pythonPrecondit',   'ngreen', '', 'none')
call s:HL('pythonDecorator',   'nred', '', 'none')
call s:HL('pythonRun',         'gray243', '', 'bold')
call s:HL('pythonCoding',      'gray243', '', 'bold')

" }}}
" SLIMV {{{

" Rainbow parentheses
call s:HL('hlLevel0', 'gray243')
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

call s:HL('VimCommentTitle', 'gray245', '', 'bold')

call s:HL('VimMapMod',    'bmagenta', '', 'none')
call s:HL('VimMapModKey', 'bmagenta', '', 'none')
call s:HL('VimNotation', 'bmagenta', '', 'none')
call s:HL('VimBracket', 'bmagenta', '', 'none')
call s:HL('VimParenSep', 'nocol', '', 'none')
call s:HL('VimOption', 'ngreen', '', 'none')

" }}}

" sh {{{

call s:HL('shDerefSimple', 'gray250', '')
call s:HL('shFunctionKey', 'gray250', 'nocol', 'bold')
call s:HL('shFunction', 'nmagenta', 'nocol', '')
call s:HL('shCommandSub', 'nocol', '', '')
call s:HL('shCmdSubRegion', 'ngreen', '')
call s:HL('shSpecial', 'gray250', '')
call s:HL('shDeref', 'gray250', '')

" }}}

" zsh {{{
call s:HL('zshDeref', 'nmagenta', '')
call s:HL('zshQuoted', 'nred', '')
call s:HL('zshTypes', 'gray250', '')
call s:HL('zshSubst', 'nmagenta', '')
" }}}

" quickfix {{{
call s:HL('qfFilename', 'nmagenta', '')
call s:HL('qfSeparator', 'nocol', '')
call s:HL('qfLineNr', 'bmagenta', '')
" }}}

" }}}

