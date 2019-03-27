if exists('g:browsers_castle_loaded') || &cp || v:version < 700
  finish
endif
let g:browsers_castle_loaded = 1

command! -nargs=? -complete=file Canary     silent call OpenInBrowser('Google Chrome Canary', <f-args>)
command! -nargs=? -complete=file Chrome     silent call OpenInBrowser('Google Chrome', <f-args>)
command! -nargs=? -complete=file Firefox    silent call OpenInBrowser('Firefox', <f-args>)
command! -nargs=? -complete=file FirefoxDev silent call OpenInBrowser('FirefoxDeveloperEdition', <f-args>)
command! -nargs=? -complete=file Safari     silent call OpenInBrowser('Safari', <f-args>)
command! -nargs=? -complete=file SafariDev  silent call OpenInBrowser('Safari Technology Preview', <f-args>)

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
