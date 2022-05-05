local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    return
end

local setup = {
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
            enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
        },
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
            motions = true, -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator windows = true, -- default bindings on <c-w> nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true, -- bindings for prefixed with g
        },
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    -- operators = { gc = "Comments" },
    key_labels = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        -- For example:
        -- ["<space>"] = "SPC",
        -- ["<cr>"] = "RET",
        -- ["<tab>"] = "TAB",
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
    },
    popup_mappings = {
        scroll_down = "<c-d>", -- binding to scroll down inside the popup
        scroll_up = "<c-u>", -- binding to scroll up inside the popup
    },
    window = {
        border = "rounded", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,
    },
    layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = "left", -- align columns left, center or right
    },
    ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
    show_help = true, -- show help message on the command line when the popup is visible
    triggers = "auto", -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specify a list manually
    triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        i = { "j", "k" },
        v = { "j", "k" },
    },
}

local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
    ["/"] = { "<cmd>lua require(\"Comment.api\").toggle_current_linewise()<CR>", "Comment" },
    ["a"] = { "<cmd>Alpha<cr>", "Dashboard" },
    ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
    b = {
        name = "Buffer",
        c = { "<cmd>Bdelete!<CR>", "Close Buffer" },
        j = { ":bnext<CR>", "Next Buffer"},
        k = { ":bprev<CR>", "Previous Buffer"},
    },

    d = {
        name = "Debug",
        d = {"<cmd>lua require('dap').continue()<CR>", "Start Debugger"},
        b = {"<cmd>lua require('dap').toggle_breakpoint()<CR>", "Toggle Breakpoint"},
        c = {"<cmd>lua require('dap').close()<CR>", "Close Current Debugging Session"},
        x = {"<cmd>lua require('dap').terminate()<CR>", "Terminate Current Debugging Session"},
        j = {"<cmd>lua require('dap').step_into()<CR>", "Step Into"},
        l = {"<cmd>lua require('dap').step_over()<CR>", "Step Over"},
        k = {"<cmd>lua require('dap').terminate()<CR>", "Step Out"},
        h = {"<cmd>lua require('dap').terminate()<CR>", "Step Back"},
        B = {"<cmd>lua require('dap').clear_breakpoints()<CR>", "Clear Breakpoints"},
        u = {"<cmd>lua require('dapui').toggle()<CR>", "Toggles Debugger UI"},
    },

    f = {
        name = "Telescope",
        f = {"<cmd>Telescope find_files<cr>", "Find Files"},
        b = {"<cmd>Telescope buffers<cr>", "Find Buffers"},
        g = {"<cmd>Telescope live_grep<cr>", "Live Grep"},
        p = {"<cmd>Telescope projects<cr>", "Switch Projects"},
        h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
        c = { "<cmd>Telescope commands<cr>", "Commands" },
        m = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
        r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
        R = { "<cmd>Telescope registers<cr>", "Registers" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        e = { "<cmd>Telescope emoji<cr>", "Emoji"},
    },

    g = {"<cmd>Neogit<cr>", "Launch Neogit"},

    p = {
        name = "Packer",
        c = { "<cmd>PackerCompile<cr>", "Compile" },
        i = { "<cmd>PackerInstall<cr>", "Install" },
        s = { "<cmd>PackerSync<cr>", "Sync" },
        S = { "<cmd>PackerStatus<cr>", "Status" },
        u = { "<cmd>PackerUpdate<cr>", "Update" },
    },

    l = {
        name = "LSP",
        a = { "<cmd>lua require('lspsaga.codeaction').code_action()<CR>", "Code Actions" },
        -- d = {
        --     "<cmd>Telescope lsp_document_diagnostics<cr>",
        --     "Document Diagnostics",
        -- }, TODO: Not working
        -- w = {
        --     "<cmd>Telescope lsp_workspace_diagnostics<cr>",
        --     "Workspace Diagnostics",
        -- },
        f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format Document" },
        i = { "<cmd>LspInfo<cr>", "LSP Info" },
        I = { "<cmd>LspInstallInfo<cr>", "LSP Installer Info and Updater" },
        h = {"<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>", "Definitions and References"},
        j = {
            "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
            "Next Diagnostic",
        },
        k = {
            "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
            "Previous Diagnostic",
        },
        o = {
            "<cmd>SymbolsOutline<cr>", "Open Symbols Outline"
        },
        -- l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
        q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Fill Quickfix List with Diagnostics" },
        r = { "<cmd>lua require('lspsaga.rename').rename()<cr>", "Rename Symbol" },
        s = { "<cmd>Telescope lsp_document_symbols<cr>", "Open Document Symbols in Telescope" },
        S = {
            "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
            "Open Workspace Symbols in Telescope",
        },

        t = {
            name = "Trouble Diagnostics",
            t = {"<cmd>TroubleToggle<cr>", "Toggle Diagnostics"},
            w = {"<cmd>TroubleToggle workspace_diagnostics<cr>", "Toggle Workspace Diagnostics"},
            b = {"<cmd>TroubleToggle document_diagnostics<cr>", "Toggle Document Diagnostics"},
            r = {"<cmd>TroubleToggle lsp_references<cr>", "Toggle LSP References"},
            d = {"<cmd>TroubleToggle lsp_definitions<cr>", "Toggle LSP Definitions"},
            y = {"<cmd>TroubleToggle lsp_type_definitions<cr>", "Toggle LSP Type Definitions"},
        }
    },
    s = {
        -- avoid using spectre, file filtering is weird
        name = "Search (Not Recommended)",
        s = {"<cmd>lua require('spectre').open()<cr>", "Search and Replace Project"},
        w = {"<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Search and Replace Word"},
        f = {"<cmd>lua require('spectre').open_file_search()<cr>", "Search and Replace in File"},
    },

    t = {
        name = "Terminal",
        n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Launch Node" },
        t = { "<cmd>ToggleTerm<cr>", "Toggle Terminal" },
        g = { "<cmd>lua _LAZYGIT_TOGGLE()<cr>", "Launch LazyGit" },
        p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Launch Python" },
        f = { "<cmd>ToggleTerm direction=float<cr>", "Launch Floating Terminal" },
        s = { "<cmd>ToggleTerm size=15 direction=horizontal<cr>", "Launch Horizontal Terminal" },
        v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Launch Vertical Terminal" },
    },

    w = {
        name = "Window",
        h = { "<cmd>lua require('swap-buffers').swap_buffers('h')<CR>", "Swap Window Left"},
        j = { "<cmd>lua require('swap-buffers').swap_buffers('j')<CR>", "Swap Window Down"},
        k = { "<cmd>lua require('swap-buffers').swap_buffers('k')<CR>", "Swap Window Up"},
        l = { "<cmd>lua require('swap-buffers').swap_buffers('l')<CR>", "Swap Window Right"},
        m = {"<cmd>MaximizerToggle<CR>", "Maximize Window Pane"},
    },

    z = {"<cmd>ZenMode<CR>", "Zen Mode"},

    ["?"] = {":Legendary<CR>", "Open Keymaps Helper"},
}

local vopts = {
    mode = "v", -- VISUAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}
local vmappings = {
    ["/"] = { "<ESC><CMD>lua require(\"Comment.api\").toggle_linewise_op(vim.fn.visualmode())<CR>", "Comment" },
    ["?"] = { "<ESC>:Legendary<CR>", "Open Keymap Helper" },
    l = {
        name = "LSP",
        a = {"<ESC><cmd>lua require('lspsaga.codeaction').range_code_action()<CR>", "Code Action"}
    } -- Doesn't seem to have a different effect from regular code actions?
--    ["s"] = {"<cmd>lua require('spectre').open_visual()<CR>", "Search and Replace Selection"}
}

which_key.setup(setup)
which_key.register(mappings, opts)
which_key.register(vmappings, vopts)
