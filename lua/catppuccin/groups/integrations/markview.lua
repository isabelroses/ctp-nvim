local M = {}

-- markview.nvim highlight groups:
-- https://github.com/OXY2DEV/markview.nvim#-highlight-groups

function M.get()
	local groups = {
		MarkviewCode = { bg = C.mantle },
		MarkviewInlineCode = { bg = C.surface0 },
		MarkviewCodeInfo = { fg = C.sky },

		-- these match the catppuccin/userstyles github theme
		MarkviewBlockQuoteDefault = { fg = C.sky },
		MarkviewBlockQuoteWarn = { fg = C.yellow }, -- warning
		MarkviewBlockQuoteError = { fg = C.red }, -- caution
		MarkviewBlockQuoteSpecial = { fg = C.muave }, -- important
		MarkviewBlockQuoteNote = { fg = C.blue }, -- note
		MarkviewBlockQuoteOk = { fg = C.green }, -- tip

		MarkviewCheckboxCancelled = { fg = C.overlay0 },
		MarkviewCheckboxChecked = { fg = C.green },
		MarkviewCheckboxPending = { fg = C.blue },
		MarkviewCheckboxProgress = { fg = C.yellow },
		MarkviewCheckboxUnchecked = { fg = C.subtext },
		MarkviewCheckboxStriked = { fg = C.red },

		MarkviewLatexSubscript = { fg = C.green },
		MarkviewLatexSuperscript = { fg = C.green },

		MarkviewListItemStar = { fg = C.peach },
		MarkviewListItemPlus = { fg = C.peach },
		MarkviewListItemMinus = { fg = C.peach },

		MarkviewEmail = { fg = C.blue },
		MarkviewImageLink = { fg = C.blue },
		MarkviewHyperlink = { fg = C.blue },

		MarkviewTableHeader = { fg = C.muave },
		MarkviewTableBorder = { fg = C.muave },
		MarkviewTableAlignCenter = { fg = C.muave },
		MarkviewTableAlignLeft = { fg = C.muave },
		MarkviewTableAlignRight = { fg = C.muave },
	}

	local syntax = require("catppuccin.groups.syntax").get()
	local base = not O.transparent_background and C.base or nil

	for i = 1, 6 do
		local color = syntax["rainbow" .. i].fg
		groups["MarkviewHeading" .. i] = { fg = color, bg = U.darken(color, 0.30, base) }
		groups["MarkviewHeading" .. i .. "Sign"] = { fg = color }

		groups["MarkviewIcon" .. i] = { fg = color, bg = C.mantle }
		groups["MarkviewIcon" .. i .. "Sign"] = { fg = color }
	end

	for i = 1, 10 do
		groups["MarkviewGradient" .. i] = { fg = syntax["rainbow" .. (i % 5 + 1)].fg }
	end

	return groups
end

return M
