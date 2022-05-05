local M = {adapters = {}, configurations = {} }

-- TODO: Figure out a better/less manual way of importing settings from folder

local python_settings = require("user.dapc.settings.python")
M["adapters"].python = python_settings["adapter"]
M["configurations"].python = python_settings["config"]

return M
