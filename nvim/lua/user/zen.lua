local status_ok, zen = pcall(require, "zen-mode")
ZEN_ACTIVE = false
if not status_ok then
	return
end

zen.setup({
	on_open = function(_) ZEN_ACTIVE = true
    end,

    on_close = function() ZEN_ACTIVE = false
    end
})
