local util = require("catppuccino.utils.util")

local M = {}

function M.setup(config)
    config = config or require("nightfox.config")

    -- References:
    -- https://coolors.co/e63946-f1faee-a8dadc-457b9d-1d3557
    -- https://coolors.co/f4f1de-e07a5f-3d405b-81b29a-f2cc8f
    -- https://coolors.co/264653-2a9d8f-e9c46a-f4a261-e76f51

    -- stylua: ignore
    local colors = {
        none = "NONE",
        bg = "#0e171c",
        fg = "#CDCECF",
        fg_gutter = "#3b4261",
        black = "#393b44",
        red = "#c94f6d",
        green = "#81B29A",
        yellow = "#dbc074",
        blue = "#719cd6",
        magenta = "#9D79D6",
        cyan = "#63cdcf",
        white = "#dfdfe0",
        orange = "#F4A261",
        pink = "#D67AD2",
        black_br = "#7f8c98",
        red_br = "#D6616B",
        green_br = "#58cd8b",
        yellow_br = "#FFE37E",
        blue_br = "#84CEE4",
        magenta_br = "#B8A1E3",
        cyan_br = "#59F0FF",
        white_br = "#F2F2F2",
        orange_br = "#F6A878",
        pink_br = "#DF97DB",
        comment = "#526175",
        git = {
            add = "#70a288",
            change = "#A58155",
            delete = "#904A6A",
            conflict = "#C07A6D"
        },
        gitSigns = {
            add = "#164846",
            change = "#394b70",
            delete = "#823c41"
        }
    }

    util.bg = colors.bg

    colors.bg_alt = util.darken(colors.bg, 0.75, "#000000")
    colors.bg_highlight = util.brighten(colors.bg, 0.10)

    colors.fg_alt = util.darken(colors.fg, 0.80, "#000000")

    colors.diff = {
        add = util.darken(colors.green, 0.15),
        delete = util.darken(colors.red, 0.15),
        change = util.darken(colors.blue, 0.15),
        text = colors.blue
    }

    colors.gitSigns = {
        add = util.brighten(colors.gitSigns.add, 0.2),
        change = util.brighten(colors.gitSigns.change, 0.2),
        delete = util.brighten(colors.gitSigns.delete, 0.2)
    }

    colors.git.ignore = colors.black
    colors.black = util.darken(colors.bg, 0.8, "#000000")
    colors.border_highlight = colors.blue
    colors.border = colors.black

    -- Popups and statusline always get a dark background
    colors.bg_popup = colors.bg_alt
    colors.bg_statusline = colors.bg_alt

    -- Sidebar and Floats are configurable
    -- colors.bg_sidebar = config.darkSidebar and colors.bg_alt or colors.bg
    -- colors.bg_float = config.darkFloat and colors.bg_alt or colors.bg
    colors.bg_sidebar = colors.bg_alt
    colors.bg_float = colors.bg_alt

    colors.bg_visual = util.darken(colors.blue, 0.2)
    colors.bg_search = util.darken(colors.cyan, 0.3)
    colors.fg_sidebar = colors.fg_alt

    colors.error = colors.red
    colors.warning = colors.yellow
    colors.info = colors.blue
    colors.hint = colors.cyan

    colors.variable = colors.white

    util.color_overrides(colors, config)

    return colors
end

return M