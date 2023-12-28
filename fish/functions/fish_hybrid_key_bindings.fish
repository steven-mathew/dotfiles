function fish_hybrid_key_bindings --description \
    vi-style
    for mode in default insert visual
        fish_default_key_bindings -M $mode
    end
    fish_vi_key_bindings --no-erase
end
