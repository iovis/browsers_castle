if exists('g:browsers_castle_loaded') || &cp || v:version < 700
  finish
endif
let g:browsers_castle_loaded = 1

function! OpenInBrowser(browser, ...)
  if a:0 == 0
    let l:route = 'http://localhost:3000'
  elseif match(a:1, '^:\d\+') != -1
    " :9001 should point to http://localhost:9001
    let l:route = 'http://localhost' . a:1
  else
    let l:route = a:1
  endif

  execute '!open "' . l:route . '" -a ' . shellescape(a:browser)
endfunction
