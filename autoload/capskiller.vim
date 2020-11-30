" Empty stubs for unsupported platforms
function! capskiller#caps_off()
endfunction

function! capskiller#caps_on()
endfunction

function! capskiller#caps_enabled()
endfunction


if !has('libcall')
    echoerr 'Error: libcall support required'
    finish
endif


if has('win64')
    let s:dll_name = 'ck_x64.dll'
elseif has('win32')
    let s:dll_name = 'ck_x86.dll'
else
    echoerr 'Error: Unsupported platform'
    finish
endif


let s:script_path=expand('<sfile>:p:h')
let s:dll_path = s:script_path . '\' . s:dll_name

if !filereadable(s:dll_path)
    echoerr 'Error: Failed to find ' . s:dll_name
    finish
endif

function! capskiller#caps_off()
    if libcallnr(s:dll_path, 'ck_caps_off', '')
        echoerr 'Error: Failed to disable CapsLock'
    endif
endfunction

function! capskiller#caps_on()
    if libcallnr(s:dll_path, 'ck_caps_on', '')
        echoerr 'Error: Failed to enable CapsLock'
    endif
endfunction

function! capskiller#caps_enabled()
    return libcallnr(s:dll_path, 'ck_caps_enabled', '')
endfunction

