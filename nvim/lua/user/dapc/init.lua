local status_ok, debug = pcall(require, "dap")
if not status_ok then
	return
end

local config = require("user.dapc.config")

debug.adapters = config["adapters"]
debug.configurations = config["configurations"]

-- TODO: Doesn't seem to work
-- debug = vim.tbl_deep_extend("force", debug, config)
