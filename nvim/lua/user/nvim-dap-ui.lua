local status_ok, nvim_dap_ui = pcall(require, "dapui")
if not status_ok then
  return
end

nvim_dap_ui.setup()
local dap = require("dap")
dap.listeners.after.event_initialized["dapui_config"] = function()
  nvim_dap_ui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  nvim_dap_ui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  nvim_dap_ui.close()
end
