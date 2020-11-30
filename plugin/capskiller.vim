if exists('g:capskiller_loaded')
    finish
endif

let g:capskiller_loaded=1

" Disable CapsLock when exit Insert and Command modes by default
if !exists('g:caps_killer_autocmd') || !g:caps_killer_autocmd
    augroup caps_control
        au!
        au InsertLeave,CmdlineLeave * call capskiller#caps_off()
    augroup end
endif

