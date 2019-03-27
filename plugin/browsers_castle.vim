if exists('g:browsers_castle_loaded') || &cp || v:version < 700
  finish
endif
let g:browsers_castle_loaded = 1

if !exists('g:browsers_castle_default_url')
  let g:browsers_castle_default_url = 'http://localhost:3000'
endif

command! -nargs=? -complete=file Canary     silent call s:openInBrowser('Google Chrome Canary', <f-args>)
command! -nargs=? -complete=file Chrome     silent call s:openInBrowser('Google Chrome', <f-args>)
command! -nargs=? -complete=file Firefox    silent call s:openInBrowser('Firefox', <f-args>)
command! -nargs=? -complete=file FirefoxDev silent call s:openInBrowser('FirefoxDeveloperEdition', <f-args>)
command! -nargs=? -complete=file Safari     silent call s:openInBrowser('Safari', <f-args>)
command! -nargs=? -complete=file SafariDev  silent call s:openInBrowser('Safari Technology Preview', <f-args>)

function! s:openInBrowser(browser, ...)
  if a:0 == 0
    let l:route = g:browsers_castle_default_url
  elseif match(a:1, '^:\d\+') != -1
    " :9001 should point to http://localhost:9001
    let l:route = 'http://localhost' . a:1
  else
    let l:route = a:1
  endif

  execute '!open "' . l:route . '" -a ' . shellescape(a:browser)
endfunction
