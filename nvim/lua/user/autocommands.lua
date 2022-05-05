vim.cmd [[

    augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd = 
    augroup end

    augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
    autocmd User AlphaReady set laststatus=0 | autocmd BufUnload <buffer> set laststatus=2
    augroup end

    " augroup _trouble_close
    " autocmd!
    " autocmd VimLeavePre * <cmd>TroubleClose<cr>
    " augroup end

]]
