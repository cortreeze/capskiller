function! s:run_test()
    call capskiller#caps_off()
    if capskiller#caps_enabled()
        return 'FAIL'
    endif

    call capskiller#caps_on()
    if !capskiller#caps_enabled()
        return 'FAIL'
    endif

    call capskiller#caps_off()
    if capskiller#caps_enabled()
        return 'FAIL'
    endif

    return 'OK'
endfunction

echo 'Tests: ' .  s:run_test()

