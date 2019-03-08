" Vim filetype plugin

if exists('b:did_ftplugin')
  finish
endif

" TODO: useful?
" runtime! ftplugin/html.vim ftplugin/html_*.vim ftplugin/html/*.vim

setlocal comments=s:{#,ex:#} commentstring=##\ %s
setlocal formatoptions+=tcqln

if exists('b:undo_ftplugin')
  let b:undo_ftplugin .= '|setl cms< com< fo<'
else
  let b:undo_ftplugin = 'setl cms< com< fo<'
endif

" Setup matchit.
if exists('loaded_matchit')
  let b:match_ignorecase = 1
  let b:match_skip = 's:Comment'
  " From ftplugin/html.vim, plus block tag matching.
  " With block tags the following is optional:
  "   - "+": disable the lstrip_blocks (only at start)
  "   - "-": the whitespaces before or after that block will be removed
  let b:match_words = '<:>,' .
        \ '<\@<=[ou]l\>[^>]*\%(>\|$\):<\@<=li\>:<\@<=/[ou]l>,' .
        \ '<\@<=dl\>[^>]*\%(>\|$\):<\@<=d[td]\>:<\@<=/dl>,' .
        \ '<\@<=\([^/][^ \t>]*\)[^>]*\%(>\|$\):<\@<=/\1>,' .
        \ '{%[-+]\? *\%(end\)\@!\(\w\+\)\>.\{-}%}:{%-\? *end\1\>.\{-}%}'
endif

" vim:set sw=2:
