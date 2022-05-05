local status_ok, legendary = pcall(require, "legendary")
-- local helpers = require("legendary.helpers")

if not status_ok then
    return
end

local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Modes
-- normal_mode = 'n'
-- visual_mode = 'v'
-- insert_mode = 'i'
-- visual_block_mode = 'x'
-- term_mode = 't'
-- command_mode = 'c'

-- stay in indent mode while indenting

legendary.setup({
    keymaps = {
        {"<", "<gv", description="Dedent", opts = opts, mode={"v"}},
        {">", ">gv", description="Indent", opts = opts, mode={"v"}},
        {"<S-l>", ":bnext<CR>", description="Go to next buffer", opts = opts},
        {"<S-h>", ":bprev<CR>", description="Go to previous buffer", opts = opts},
        {"<A-h>", ":lua require('smart-splits').resize_left()<CR>", description = "Resize window pane to the left", opts = opts},
        {"<A-j>", ":lua require('smart-splits').resize_down()<CR>", description = "Resize window pane down", opts = opts},
        {"<A-k>", ":lua require('smart-splits').resize_up()<CR>", description = "Resize window pane up", opts = opts},
        {"<A-l>", ":lua require('smart-splits').resize_right()<CR>", description = "Resize window pane to the right", opts = opts},
        {"K",":lua require('lspsaga.hover').render_hover_doc()<CR>", description = "Show documentation" , opts},
        {"<C-j>",":lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", description="Scroll lspsaga window down", opts},
        {"<C-k>",":lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", description="Scroll lspsaga window up", opts},
        {"gl", ":lua require('lspsaga.diagnostic').show_line_diagnostics()<CR>", description="Show lsp diagnostics on line", opts},
        {"gL", ":lua require('lspsaga.diagnostic').show_cursor_diagnostics()<CR>", description="Show lsp diagnostics under cursor", opts},
    }
})
