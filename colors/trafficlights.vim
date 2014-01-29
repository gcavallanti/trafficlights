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

let s:bwc.white           = ['ffffff', 231]
let s:bwc.brightestgravel = ['eeeeee', 255]
let s:bwc.brightgravel    = ['d0d0d0', 252]
let s:bwc.plain           = ['bcbcbc', 250]
let s:bwc.lightgravel     = ['8a8a8a', 245]
let s:bwc.gravel          = ['767676', 243]
let s:bwc.mediumgravel    = ['626262', 241]
let s:bwc.deepgravel      = ['585858', 240]
let s:bwc.deepergravel    = ['3a3a3a', 237]
let s:bwc.deepestgravel   = ['303030', 236]
let s:bwc.darkgravel      = ['262626', 235]
let s:bwc.blackgravel     = ['1c1c1c', 234]
let s:bwc.blackestgravel  = ['121212', 233]
let s:bwc.black           = ['000000', 232]

let s:bwc.lightyellow     = ['ffcc66', 221]
let s:bwc.lighteryellow   = ['ffcc66', 222]
let s:bwc.green           = ['8cffba', 121]
let s:bwc.lightgreen      = ['aeee00', 118]
let s:bwc.lightblue       = ['0a9dff', 69]
let s:bwc.orange          = ['ffa724', 214]
let s:bwc.red             = ['ff2c4b', 167]
let s:bwc.purple          = ['b88853', 99]
let s:bwc.lightpurple     = ['ff9eb8', 212]
let s:bwc.lightbrown      = ['c7915b', 173]
let s:bwc.darkbrown       = ['88633f', 95]

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
    let s:gutter = 'blackestgravel'
else
    let s:gutter = 'blackgravel'
endif

if exists('g:trafficlights_tabline')
    if g:trafficlights_tabline == 0
        let s:tabline = 'blackestgravel'
    elseif  g:trafficlights_tabline == 1
        let s:tabline = 'blackgravel'
    elseif  g:trafficlights_tabline == 2
        let s:tabline = 'darkgravel'
    elseif  g:trafficlights_tabline == 3
        let s:tabline = 'deepgravel'
    else
        let s:tabline = 'blackestgravel'
    endif
else
    let s:tabline = 'blackgravel'
endif

" }}}

" Actual colorscheme ----------------------------------------------------------
" Vanilla Vim {{{

" General/UI {{{

call s:HL('Normal', 'plain', 'blackestgravel')

call s:HL('Folded', 'mediumgravel', 'bg', 'none')

call s:HL('VertSplit', 'darkgravel', 'bg', 'none')
" call s:HL('VertSplit', 'lightgravel', 'bg', 'none')

call s:HL('CursorLine',   '', 'blackgravel', 'none')
call s:HL('CursorColumn', '', 'blackgravel')
call s:HL('ColorColumn',  '', 'blackgravel')

call s:HL('TabLine', 'plain', s:tabline, 'none')
call s:HL('TabLineFill', 'plain', s:tabline, 'none')
call s:HL('TabLineSel', 'black', 'lightblue', 'none')

call s:HL('MatchParen', 'lightgreen', 'bg', 'bold')

call s:HL('NonText',    'deepgravel', 'bg')
call s:HL('SpecialKey', 'deepgravel', 'bg')

call s:HL('Visual',    '',  'deepergravel')
call s:HL('VisualNOS', '',  'deepergravel')

call s:HL('Search',    'black', 'purple', 'none')
call s:HL('IncSearch', 'black', 'lightpurple',    'none')

call s:HL('Underlined', 'fg', '', 'underline')

call s:HL('StatusLine',   'brightestgravel', 'deepestgravel', 'none')
call s:HL('StatusLineNC', 'deepgravel', 'darkgravel', 'none')
call s:HL('User1', 'brightestgravel', 'darkgravel', 'none')
call s:HL('User2', 'white', 'orange', 'none')
call s:HL('User3', 'gravel', 'deepestgravel', 'none')
call s:HL('User4', 'brightestgravel', 'deepestgravel', 'none')
call s:HL('User5', 'brightestgravel', 'deepergravel', 'none')
call s:HL('User6', 'white', 'deepgravel', 'none')
call s:HL('User7', 'white', 'red', 'none')
call s:HL('User8', 'white', 'lightblue', 'none')
call s:HL('User9', 'white', 'purple', 'none')
call s:HL('User0', 'white', 'deepgravel', 'none')

call s:HL('Directory', 'lightblue', '', 'none')

call s:HL('Title', 'lightgreen')

call s:HL('ErrorMsg',   'red',       'bg', 'none')
call s:HL('MoreMsg',    'lightyellow',   '',   'none')
call s:HL('ModeMsg',    'lighteryellow', '',   'none')
call s:HL('Question',   'lighteryellow', '',   'none')
call s:HL('WarningMsg', 'lightpurple',       '',   'none')

" This is a ctags tag, not an HTML one.  'Something you can use c-] on'.
call s:HL('Tag', '', '', 'bold')

" hi IndentGuides                  guibg=#373737
" hi WildMenu        guifg=#66D9EF guibg=#000000

" }}}
" Gutter {{{

call s:HL('CursorLineNr',     'lightgravel', s:gutter)
call s:HL('LineNr',     'deepergravel', s:gutter)
call s:HL('SignColumn', '',             s:gutter)
call s:HL('FoldColumn', 'mediumgravel', s:gutter)

" }}}
" Cursor {{{

call s:HL('Cursor',  'black', 'lightblue', 'bold')
call s:HL('vCursor', 'black', 'lightblue', 'bold')
call s:HL('iCursor', 'black', 'lightblue', 'none')

" }}}
" Syntax highlighting {{{

" Start with a simple base.
call s:HL('Special', 'plain')

" Comments are slightly brighter than folds, to make 'headers' easier to see.
call s:HL('Comment',        'gravel')
call s:HL('Todo',           'white', 'bg', 'bold')
call s:HL('SpecialComment', 'white', 'bg', 'bold')

" Strings are a nice, pale straw color.  Nothing too fancy.
call s:HL('String', 'lightyellow')

" Control flow stuff is red.
call s:HL('Statement',   'brightgravel', '', 'bold')
call s:HL('Keyword',     'brightgravel', '', 'bold')
call s:HL('Conditional', 'brightgravel', '', 'bold')
call s:HL('Operator',    'brightgravel', '', 'bold')
call s:HL('Label',       'plain', '', 'bold')
call s:HL('Repeat',      'brightgravel', '', 'bold')


" Functions and variable declarations are orange, because plain looks weird.
call s:HL('Identifier', 'purple', '', 'none')
call s:HL('Function',   'red', '', 'none')

" Preprocessor stuff is lightgreen, to make it pop.
"
" This includes imports in any given language, because they should usually be
" grouped together at the beginning of a file.  If they're in the middle of some
" other code they should stand out, because something tricky is
" probably going on.
call s:HL('PreProc',   'lightgreen', '', 'none')
call s:HL('Macro',     'lightgreen', '', 'none')
call s:HL('Define',    'lightgreen', '', 'none')
call s:HL('PreCondit', 'lightgreen', '', 'bold')

" Constants of all kinds are colored together.
" I'm not really happy with the color yet...
call s:HL('Constant',  'purple', '', 'bold')
call s:HL('Character', 'purple', '', 'bold')
call s:HL('Boolean',   'purple', '', 'bold')

call s:HL('Number', 'red', '', 'none')
call s:HL('Float',  'purple', '', 'bold')

" Not sure what 'special character in a constant' means, but let's make it pop.
call s:HL('SpecialChar', 'lightpurple', '', 'bold')

call s:HL('Type', 'lightpurple', '', 'none')
call s:HL('StorageClass', 'red', '', 'none')
call s:HL('Structure', 'red', '', 'none')
call s:HL('Typedef', 'red', '', 'bold')

" Make try/catch blocks stand out.
call s:HL('Exception', 'lightgreen', '', 'bold')

" Misc
call s:HL('Error',  'white',   'red', 'bold')
call s:HL('Debug',  'white',   '',      'bold')
call s:HL('Ignore', 'gravel', '',      '')

" }}}
" Completion Menu {{{

call s:HL('Pmenu', 'plain', 'deepergravel')
call s:HL('PmenuSel', 'black', 'lightblue', 'bold')
call s:HL('PmenuSbar', '', 'deepergravel')
call s:HL('PmenuThumb', 'brightgravel')

" }}}
" Diffs {{{

call s:HL('DiffDelete', 'black', 'black')
call s:HL('DiffAdd',    '',     'deepergravel')
call s:HL('DiffChange', '',     'darkgravel')
call s:HL('DiffText',   'white', 'deepergravel', 'bold')

" }}}
" Spelling {{{

if has("spell")
    call s:HL('SpellCap', 'lightyellow', 'bg', 'undercurl,bold', 'lightyellow')
    call s:HL('SpellBad', '', 'bg', 'undercurl', 'lightyellow')
    call s:HL('SpellLocal', '', '', 'undercurl', 'lightyellow')
    call s:HL('SpellRare', '', '', 'undercurl', 'lightyellow')
endif

" }}}

" }}}
" Plugins {{{

" CtrlP {{{

    " the message when no match is found
    call s:HL('CtrlPNoEntries', 'white', 'red', 'bold')

    " the matched pattern
    call s:HL('CtrlPMatch', 'orange', 'bg', 'none')

    " the line prefix '>' in the match window
    call s:HL('CtrlPLinePre', 'deepgravel', 'bg', 'none')

    " the prompt’s base
    call s:HL('CtrlPPrtBase', 'deepgravel', 'bg', 'none')

    " the prompt’s text
    call s:HL('CtrlPPrtText', 'plain', 'bg', 'none')

    " the prompt’s cursor when moving over the text
    call s:HL('CtrlPPrtCursor', 'black', 'lightblue', 'bold')

    " 'prt' or 'win', also for 'regex'
    call s:HL('CtrlPMode1', 'black', 'lightblue', 'bold')

    " 'file' or 'path', also for the local working dir
    call s:HL('CtrlPMode2', 'black', 'lightblue', 'bold')

    " the scanning status
    call s:HL('CtrlPStats', 'black', 'lightblue', 'bold')

    " TODO: CtrlP extensions.
    " CtrlPTabExtra  : the part of each line that’s not matched against (Comment)
    " CtrlPqfLineCol : the line and column numbers in quickfix mode (|s:HL-Search|)
    " CtrlPUndoT     : the elapsed time in undo mode (|s:HL-Directory|)
    " CtrlPUndoBr    : the square brackets [] in undo mode (Comment)
    " CtrlPUndoNr    : the undo number inside [] in undo mode (String)

" }}}
" EasyMotion {{{

call s:HL('EasyMotionTarget', 'lightblue',     'bg', 'bold')
call s:HL('EasyMotionShade',  'deepgravel', 'bg')

" }}}
" Interesting Words {{{

" These are only used if you're me or have copied the <leader>hNUM mappings
" from my Vimrc.
call s:HL('InterestingWord1', 'black', 'orange')
call s:HL('InterestingWord2', 'black', 'lightgreen')
call s:HL('InterestingWord3', 'black', 'green')
call s:HL('InterestingWord4', 'black', 'purple')
call s:HL('InterestingWord5', 'black', 'lightpurple')
call s:HL('InterestingWord6', 'black', 'red')


" }}}
" Makegreen {{{

" hi GreenBar term=reverse ctermfg=white ctermbg=green guifg=black guibg=#9edf1c
" hi RedBar   term=reverse ctermfg=white ctermbg=red guifg=white guibg=#C50048

" }}}
" Rainbow Parentheses {{{

call s:HL('level16c', 'mediumgravel',   '', 'bold')
call s:HL('level15c', 'lightyellow',      '', '')
call s:HL('level14c', 'lightpurple',          '', '')
call s:HL('level13c', 'orange',         '', '')
call s:HL('level12c', 'lightblue',         '', '')
call s:HL('level11c', 'lightgreen',           '', '')
call s:HL('level10c', 'purple',         '', '')
call s:HL('level9c',  'green', '', '')
call s:HL('level8c',  'lightbrown',         '', '')
call s:HL('level7c',  'lightyellow',      '', '')
call s:HL('level6c',  'lightpurple',          '', '')
call s:HL('level5c',  'orange',         '', '')
call s:HL('level4c',  'lightblue',         '', '')
call s:HL('level3c',  'lightgreen',           '', '')
call s:HL('level2c',  'purple',         '', '')
call s:HL('level1c',  'green', '', '')

" }}}
" ShowMarks {{{

call s:HL('ShowMarksHLl', 'lightblue', 'blackestgravel')
call s:HL('ShowMarksHLu', 'lightblue', 'blackestgravel')
call s:HL('ShowMarksHLo', 'lightblue', 'blackestgravel')
call s:HL('ShowMarksHLm', 'lightblue', 'blackestgravel')

" }}}

" }}}
" Filetype-specific {{{

" Clojure {{{

call s:HL('clojureSpecial',  'red', '', '')
call s:HL('clojureDefn',     'red', '', '')
call s:HL('clojureDefMacro', 'red', '', '')
call s:HL('clojureDefine',   'red', '', '')
call s:HL('clojureMacro',    'red', '', '')
call s:HL('clojureCond',     'red', '', '')

call s:HL('clojureKeyword', 'orange', '', 'none')

call s:HL('clojureFunc',   'lightpurple', '', 'none')
call s:HL('clojureRepeat', 'lightpurple', '', 'none')

call s:HL('clojureParen0', 'lightgravel', '', 'none')

call s:HL('clojureAnonArg', 'white', '', 'bold')

" }}}
" CSS {{{

if g:trafficlights_css_props_highlight
    call s:HL('cssColorProp', 'lighteryellow', '', 'none')
    call s:HL('cssBoxProp', 'lighteryellow', '', 'none')
    call s:HL('cssTextProp', 'lighteryellow', '', 'none')
    call s:HL('cssRenderProp', 'lighteryellow', '', 'none')
    call s:HL('cssGeneratedContentProp', 'lighteryellow', '', 'none')
else
    call s:HL('cssColorProp', 'fg', '', 'none')
    call s:HL('cssBoxProp', 'fg', '', 'none')
    call s:HL('cssTextProp', 'fg', '', 'none')
    call s:HL('cssRenderProp', 'fg', '', 'none')
    call s:HL('cssGeneratedContentProp', 'fg', '', 'none')
end

call s:HL('cssValueLength', 'purple', '', 'bold')
call s:HL('cssColor', 'purple', '', 'bold')
call s:HL('cssBraces', 'lightgravel', '', 'none')
call s:HL('cssIdentifier', 'orange', '', 'bold')
call s:HL('cssClassName', 'orange', '', 'none')

" }}}
" Diff {{{

call s:HL('gitDiff', 'lightgravel', '',)

call s:HL('diffRemoved', 'red', '',)
call s:HL('diffAdded', 'lightgreen', '',)
call s:HL('diffFile', 'black', 'red', 'bold')
call s:HL('diffNewFile', 'black', 'red', 'bold')

call s:HL('diffLine', 'lightyellow', 'bg', 'none')
call s:HL('diffSubname', 'orange', '', 'none')

" }}}
" Django Templates {{{

call s:HL('djangoArgument', 'lighteryellow', '',)
call s:HL('djangoTagBlock', 'orange', '')
call s:HL('djangoVarBlock', 'orange', '')
" hi djangoStatement guifg=#ff3853 gui=bold
" hi djangoVarBlock guifg=#f4cf86

" }}}
" HTML {{{

" Punctuation
call s:HL('htmlTag',    'darkbrown', 'bg', 'none')
call s:HL('htmlEndTag', 'darkbrown', 'bg', 'none')

" Tag names
call s:HL('htmlTagName',        'lightbrown', '', 'bold')
call s:HL('htmlSpecialTagName', 'lightbrown', '', 'bold')
call s:HL('htmlSpecialChar',    'lightgreen',   '', 'none')

" Attributes
call s:HL('htmlArg', 'lightbrown', '', 'none')

" Stuff inside an <a> tag

if g:trafficlights_html_link_underline
    call s:HL('htmlLink', 'lightgravel', '', 'underline')
else
    call s:HL('htmlLink', 'lightgravel', '', 'none')
endif

" }}} 
" Java {{{

call s:HL('javaClassDecl', 'red', '', 'bold')
call s:HL('javaScopeDecl', 'red', '', 'bold')
call s:HL('javaCommentTitle', 'gravel', '')
call s:HL('javaDocTags', 'white', '', 'none')
call s:HL('javaDocParam', 'lightyellow', '', '')

" }}}
" LaTeX {{{

call s:HL('texStatement', 'lightblue', '', 'none')
call s:HL('texMathZoneX', 'orange', '', 'none')
call s:HL('texMathZoneA', 'orange', '', 'none')
call s:HL('texMathZoneB', 'orange', '', 'none')
call s:HL('texMathZoneC', 'orange', '', 'none')
call s:HL('texMathZoneD', 'orange', '', 'none')
call s:HL('texMathZoneE', 'orange', '', 'none')
call s:HL('texMathZoneV', 'orange', '', 'none')
call s:HL('texMathZoneX', 'orange', '', 'none')
call s:HL('texMath', 'orange', '', 'none')
call s:HL('texMathMatcher', 'orange', '', 'none')
call s:HL('texRefLabel', 'lighteryellow', '', 'none')
call s:HL('texRefZone', 'lightgreen', '', 'none')
call s:HL('texComment', 'gravel', '', 'none')
call s:HL('texDelimiter', 'orange', '', 'none')
call s:HL('texZone', 'brightgravel', '', 'none')

augroup trafficlights_tex
    au!

    au BufRead,BufNewFile *.tex syn region texMathZoneV start="\\(" end="\\)\|%stopzone\>" keepend contains=@texMathZoneGroup
    au BufRead,BufNewFile *.tex syn region texMathZoneX start="\$" skip="\\\\\|\\\$" end="\$\|%stopzone\>" keepend contains=@texMathZoneGroup
augroup END

" }}}
" LessCSS {{{

call s:HL('lessVariable', 'lightgreen', '', 'none')

" }}}
" Lispyscript {{{

call s:HL('lispyscriptDefMacro', 'lightgreen', '', '')
call s:HL('lispyscriptRepeat', 'lightpurple', '', 'none')

" }}}
" Mail {{{

call s:HL('mailSubject', 'orange', '', 'bold')
call s:HL('mailHeader', 'lightgravel', '', '')
call s:HL('mailHeaderKey', 'lightgravel', '', '')
call s:HL('mailHeaderEmail', 'white', '', '')
call s:HL('mailURL', 'purple', '', 'underline')
call s:HL('mailSignature', 'gravel', '', 'none')

call s:HL('mailQuoted1', 'gravel', '', 'none')
call s:HL('mailQuoted2', 'lightpurple', '', 'none')
call s:HL('mailQuoted3', 'lighteryellow', '', 'none')
call s:HL('mailQuoted4', 'orange', '', 'none')
call s:HL('mailQuoted5', 'lightgreen', '', 'none')

" }}}
" Markdown {{{

call s:HL('markdownHeadingRule', 'lightgravel', '', 'bold')
call s:HL('markdownHeadingDelimiter', 'lightgravel', '', 'bold')
call s:HL('markdownOrderedListMarker', 'lightgravel', '', 'bold')
call s:HL('markdownListMarker', 'lightgravel', '', 'bold')
call s:HL('markdownItalic', 'white', '', 'bold')
call s:HL('markdownBold', 'white', '', 'bold')
call s:HL('markdownH1', 'orange', '', 'bold')
call s:HL('markdownH2', 'lightgreen', '', 'bold')
call s:HL('markdownH3', 'lightgreen', '', 'none')
call s:HL('markdownH4', 'lightgreen', '', 'none')
call s:HL('markdownH5', 'lightgreen', '', 'none')
call s:HL('markdownH6', 'lightgreen', '', 'none')
call s:HL('markdownLinkText', 'purple', '', 'underline')
call s:HL('markdownIdDeclaration', 'purple')
call s:HL('markdownAutomaticLink', 'purple', '', 'bold')
call s:HL('markdownUrl', 'purple', '', 'bold')
call s:HL('markdownUrldelimiter', 'lightgravel', '', 'bold')
call s:HL('markdownLinkDelimiter', 'lightgravel', '', 'bold')
call s:HL('markdownLinkTextDelimiter', 'lightgravel', '', 'bold')
call s:HL('markdownCodeDelimiter', 'lighteryellow', '', 'bold')
call s:HL('markdownCode', 'lighteryellow', '', 'none')
call s:HL('markdownCodeBlock', 'lighteryellow', '', 'none')

" }}}
" MySQL {{{

call s:HL('mysqlSpecial', 'lightpurple', '', 'bold')

" }}}
" Python {{{

hi def link pythonOperator Operator
call s:HL('pythonBuiltin',     'lightpurple')
call s:HL('pythonBuiltinObj',  'lightpurple')
call s:HL('pythonBuiltinFunc', 'lightpurple')
call s:HL('pythonEscape',      'lightpurple')
call s:HL('pythonException',   'lightgreen', '', 'bold')
call s:HL('pythonExceptions',  'lightgreen', '', 'none')
call s:HL('pythonPrecondit',   'lightgreen', '', 'none')
call s:HL('pythonDecorator',   'red', '', 'none')
call s:HL('pythonRun',         'gravel', '', 'bold')
call s:HL('pythonCoding',      'gravel', '', 'bold')

" }}}
" SLIMV {{{

" Rainbow parentheses
call s:HL('hlLevel0', 'gravel')
call s:HL('hlLevel1', 'orange')
call s:HL('hlLevel2', 'green')
call s:HL('hlLevel3', 'lightpurple')
call s:HL('hlLevel4', 'lightbrown')
call s:HL('hlLevel5', 'lighteryellow')
call s:HL('hlLevel6', 'orange')
call s:HL('hlLevel7', 'green')
call s:HL('hlLevel8', 'lightpurple')
call s:HL('hlLevel9', 'lightbrown')

" }}}
" Vim {{{

call s:HL('VimCommentTitle', 'lightgravel', '', 'bold')

call s:HL('VimMapMod',    'lightpurple', '', 'none')
call s:HL('VimMapModKey', 'lightpurple', '', 'none')
call s:HL('VimNotation', 'lightpurple', '', 'none')
call s:HL('VimBracket', 'lightpurple', '', 'none')

" }}}

" }}}

