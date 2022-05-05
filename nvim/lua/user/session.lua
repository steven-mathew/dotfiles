local status_ok, session = pcall(require, "auto-session")
if not status_ok then
	return
end

local function close_neogit()
    if vim.bo.filetype == "NeogitStatus" then
        require("neogit").close()
    end
end

local function close_zenmode()
    if ZEN_ACTIVE then
        require("zen-mode").toggle()
    end
end

session.setup({
    log_level = 'info',
    auto_session_suppress_dirs = {"~/", "~/Projects", "~/PycharmProjects"},
    pre_save_cmds = {close_neogit, "NvimTreeClose", "TroubleClose", "SymbolsOutlineClose", close_zenmode}

})

