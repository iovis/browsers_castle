if exists('g:browsers_castle_loaded') || &cp || v:version < 700
  finish
endif
let g:browsers_castle_loaded = 1

if !exists('g:browsers_castle_default_url')
  let g:browsers_castle_default_url = 'http://localhost:3000'
endif

command! -nargs=? -complete=file Canary     silent call <SID>openInBrowser('Google Chrome Canary', <f-args>)
command! -nargs=? -complete=file Chrome     silent call <SID>openInBrowser('Google Chrome', <f-args>)
command! -nargs=? -complete=file Firefox    silent call <SID>openInBrowser('Firefox', <f-args>)
command! -nargs=? -complete=file FirefoxDev silent call <SID>openInBrowser('FirefoxDeveloperEdition', <f-args>)
command! -nargs=? -complete=file Safari     silent call <SID>openInBrowser('Safari', <f-args>)
command! -nargs=? -complete=file SafariDev  silent call <SID>openInBrowser('Safari Technology Preview', <f-args>)

command! -nargs=+ Google silent call <SID>searchInBrowser('Google Chrome', <q-args>)

function! s:openInBrowser(browser, ...)
  if a:0 == 0
    let l:route = g:browsers_castle_default_url
  elseif match(a:1, '^:\d\+') != -1
    " :9001 should point to http://localhost:9001
    let l:route = 'http://localhost' . a:1
  else
    let l:route = a:1
  endif

  call <SID>open(l:route, a:browser)
endfunction

function! s:searchInBrowser(browser, search)
  let l:google = 'https://www.google.com/search?q='
  let l:route  = l:google . a:search

  call <SID>open(l:route, a:browser)
endfunction

function! s:open(route, browser)
  execute '!open "' . a:route . '" -a ' . shellescape(a:browser)
endfunction
