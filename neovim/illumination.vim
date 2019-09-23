let s:bin = 'illumination'

if !exists('s:nvimMdJobId')
    let s:nvimMdJobId = 0
endif

function! s:configureCommands()
    command! -nargs=0 IlluRender :call s:render()
    command! -nargs=0 IlluClose :call s:render_stop()
    command! -nargs=+ IlluRustDocOpen :call s:render(<f-args>)
endfunction

call s:configureCommands() 

function! s:initRpc()
    let id = jobstart([s:bin], { 'rpc': v:true })
    return id
endfunction

function! s:render_stop() 
    echom s:nvimMdJobId
    call jobstop(s:nvimMdJobId)
endfunction

function! s:render()
    let s:nvimMdJobId = s:initRpc()
    if 0 == s:nvimMdJobId
        echoerr "nvimMd: cannot start rpc process"
    elseif -1 == s:nvimMdJobId
        echoerr "nvimMd: rpc process is not executable"
    else
    
    endif
endfunction