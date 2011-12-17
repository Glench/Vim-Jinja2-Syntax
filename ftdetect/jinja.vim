" Figure out which type of hilighting to use for html.
fun! s:SelectHTML()
let n = 1
while n < 50 && n < line("$")
  " check for jinja
  if getline(n) =~ '{%\s*\(extends\|block\|macro\|set\|if\|for\|include\|trans\)\>'
    set ft=jinja
    return
  endif
    let n = n + 1
  endwhile
  " go with html
  set ft=html
endfun
autocmd BufNewFile,BufRead *.html,*.htm  call s:SelectHTML()
