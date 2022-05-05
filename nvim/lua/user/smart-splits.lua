local status_ok, smart_splits = pcall(require, 'smart-splits')
if not status_ok then
    return
end

smart_splits.ignored_buftypes = { 'NvimTree' }
smart_splits.ignored_buftypes = {
    'nofile',
    'quickfix',
    'prompt'
}

