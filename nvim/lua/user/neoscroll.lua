local status_ok, neoscroll = pcall(require, "neoscroll")
-- local helpers = require("legendary.helpers")

if not status_ok then
    return
end

neoscroll.setup({
    easing_function=nil
})
