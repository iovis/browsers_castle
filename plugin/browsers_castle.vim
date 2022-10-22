if exists('g:browsers_castle_loaded') || &cp || v:version < 700
  finish
endif
let g:browsers_castle_loaded = 1

if !exists('g:browsers_castle_default_url')
  let g:browsers_castle_default_url = 'http://localhost:3000'
endif

command! -nargs=? -complete=file Browser    silent call <SID>open(<f-args>)
command! -nargs=? -complete=file Canary     silent call <SID>openInBrowser('Google Chrome Canary', <f-args>)
command! -nargs=? -complete=file Chrome     silent call <SID>openInBrowser('Google Chrome', <f-args>)
command! -nargs=? -complete=file Firefox    silent call <SID>openInBrowser('Firefox', <f-args>)
command! -nargs=? -complete=file FirefoxDev silent call <SID>openInBrowser('FirefoxDeveloperEdition', <f-args>)
command! -nargs=? -complete=file Safari     silent call <SID>openInBrowser('Safari', <f-args>)
command! -nargs=? -complete=file SafariDev  silent call <SID>openInBrowser('Safari Technology Preview', <f-args>)

command! -nargs=+ Google silent call SearchIn('https://www.google.com/search?q=%%QUERY%%', <q-args>)

function! s:openInBrowser(browser, ...)
  if a:0 == 0
    let l:route = g:browsers_castle_default_url
  elseif match(a:1, '^:\d\+') != -1
    " :9001 should point to http://localhost:9001
    let l:route = 'http://localhost' . a:1
  else
    let l:route = a:1
  endif

  call s:open(l:route, a:browser)
endfunction

function! SearchIn(url, search)
  let l:route = substitute(a:url, '%%QUERY%%', s:url_encode(a:search), '')
  call s:open(l:route)
endfunction

function! s:open(route, ...)
  let l:browser = get(a:, 1)
  let l:open_command = 'open ' . shellescape(a:route)

  if !empty(l:browser)
    let l:open_command .= ' -a ' . shellescape(l:browser)
  endif

  call system(l:open_command)
endfunction

" Shamelessly copied from tpope/vim-unimpaired
function! s:url_encode(str) abort
  " iconv trick to convert utf-8 bytes to 8bits indiviual char.
  " Had to add \\ before the % to avoid vim expanding it in :execute
  return substitute(iconv(a:str, 'latin1', 'utf-8'),'[^A-Za-z0-9_.~-]','\="\\%".printf("%02X",char2nr(submatch(0)))','g')
endfunction
