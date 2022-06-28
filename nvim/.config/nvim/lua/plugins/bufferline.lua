local bufferline = require("bufferline")

bufferline.setup(
    {
        options = {
            -- offsets = {{filetype = "NvimTree", text = "", padding = 1}},
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "",
                    highlight = "Directory",
                    text_align = "left"
                }
            },
            modified_icon = "",
            show_close_icon = false,
            left_trunc_marker = "",
            right_trunc_marker = "",
            max_name_length = 14,
            max_prefix_length = 13,
            tab_size = 20,
            show_tab_indicators = true,
            enforce_regular_tabs = false,
            view = "multiwindow",
            show_buffer_close_icons = false,
            --separator_style = "slant",
            always_show_bufferline = true,
            diagnostics = false
        }
    }
)
