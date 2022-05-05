local status_ok, wilder = pcall(require, "wilder")
if not status_ok then
  return
end

wilder.setup({modes = {":", "/", "?"}})
wilder.set_option("pipeline",
    wilder.branch(
        wilder.python_file_finder_pipeline({
            file_command = {"find", ".", "-type", "f", "-printf", "%P\n"},
            dir_command = {"find", ".", "-type", "d", "-printf", "%P\n"},
            filter = {"fuzzy_filter", "difflib_sorter"}
        }),
        wilder.cmdline_pipeline({language = "python", fuzzy = 1}),
        wilder.python_search_pipeline({
            pattern = wilder.python_fuzzy_pattern(),
            sorter = wilder.python_difflib_sorter(), engine = "re"
        })
    )
)

wilder.set_option("renderer", wilder.popupmenu_renderer({
    highlighter = wilder.basic_highlighter(),
}))
