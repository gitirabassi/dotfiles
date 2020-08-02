" Generate Table Tests
if !exists("g:go_gotests_bin")
  let g:go_gotests_bin = "gotests"
endif

" Append output of gotests to corresponding _test.go file
function! s:GoTableTests(bang, ...)
  let func = search('^func ', "bcnW")
  if func == 0
    echo "no func found previous to cursor"
    return
  end
  let line = getline(func)
  let fname = split(split(line, " ")[1], "(")[0]
  " Check if binary exists
  let bin_path = go#path#CheckBinPath(g:go_gotests_bin)
  if empty(bin_path)
    return
  endif
  let file = expand('%')
  " Shouldn't happen as this function shouldn't be registered
  if empty(file)
    call go#util#EchoError("write go file to disk first")
    return
  endif
  " Ensure changes are written to disk for tool to read updated version
  if &modified
    call go#util#EchoError("unsaved changes in buffer")
    return
  endif
  " Run gotests
  let out = system(bin_path . ' -w -only ^' . shellescape(fname) . '$ ' . shellescape(file))
  if v:shell_error
    call go#util#EchoError("gotests error: " . out)
  endif
endfunction

command! -nargs=* GoTableTests call s:GoTableTests(0)

" Execute dlv and break
if !exists("g:go_dlv_bin")
  let g:go_dlv_bin= "dlv"
endif

" Execute the test with delve in a :terminal and break at the current line
function! s:GoTestDelve(bang, ...)
  let func = search('^func ', "bcnW")
  if func == 0
    echo "no func found previous to cursor"
    return
  end
  let line = getline(func)
  let fname = split(split(line, " ")[1], "(")[0]
  " Check if binary exists
  let bin_path = go#path#CheckBinPath(g:go_dlv_bin)
  if empty(bin_path)
    return
  endif
  let file = expand('%')
  " Shouldn't happen as this function shouldn't be registered
  if empty(file)
    call go#util#EchoError("write go file to disk first")
    return
  endif
  " Ensure changes are written to disk for tool to read updated version
  if &modified
    call go#util#EchoError("unsaved changes in buffer")
    return
  endif
  " Run dlv
  " dlv test -v -timeout 30s github.com/influxdata/go-wireguard -run ^Test_parseNetlinkMessages$
  let regfname = '^' . fname . '$'
  let pkgname = go#package#FromPath(file)
  let bfname = 'b ' . fname
  let debugcmd = bin_path . ' test  --init <(echo ' . shellescape(bfname) . ') ' . shellescape(pkgname) . ' -- -test.run ' . shellescape(regfname)
  split(:sp)
  call termopen(debugcmd)
endfunction

command! -nargs=* GoTestDelve  call s:GoTestDelve(0)
