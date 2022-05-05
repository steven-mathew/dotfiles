local status_ok, better_escape = pcall(require, "better_escape")
if not status_ok then
    return
end

better_escape.setup({
    mapping = {"jk", "kj"}, -- a table with mappings to use
    timeout = 100, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
})
