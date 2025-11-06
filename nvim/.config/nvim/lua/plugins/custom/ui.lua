return {
	{ "folke/tokyonight.nvim", lazy = true },
	{ "gruvbox-community/gruvbox", lazy = true },
	{ "bluz71/vim-moonfly-colors", lazy = true },
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			flavour = "mocha",
			color_overrides = {
				mocha = {
					-- base = "#000000",
					-- mantle = "#000000",
					-- crust = "#181826",
					crust = "#313245",
				},
			},
			custom_highlights = function(colors)
				return {
					-- Set active window background to black
					-- NormalFloat = { bg = "#000000" },
					Normal = { bg = "#000000" },
					-- Keep inactive windows with default catppuccin background
					NormalNC = { bg = colors.base },
				}
			end,
			integrations = {
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
						ok = { "italic" },
					},
					underlines = {
						errors = { "undercurl" },
						hints = { "undercurl" },
						warnings = { "undercurl" },
						information = { "undercurl" },
						ok = { "undercurl" },
					},
					inlay_hints = {
						background = true,
					},
				},
			},
		},
	},

	-- Fancier statusline
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = "auto",
					component_separators = "", --{ left = '', right = '' },
					section_separators = "", --{ left = '', right = '' },
					disabled_filetypes = {
						statusline = {},
						winbar = {},
					},
					ignore_focus = {},
					always_divide_middle = true,
					globalstatus = true,
					refresh = {
						statusline = 1000,
						tabline = 1000,
						winbar = 1000,
					},
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = {
						"branch",
						"diff",
						{
							"diagnostics",
							symbols = { error = " ", warn = " ", hint = " ", info = " " },
							-- symbols = { error = "❌", warn = "⚠️", hint = "💡", info = "ℹ️" },
						},
					},
					lualine_c = { { "filename", path = 1 } },
					lualine_x = { "encoding", "fileformat", "filetype" },
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { "filename" },
					lualine_x = { "location" },
					lualine_y = {},
					lualine_z = {},
				},
				tabline = {},
				winbar = {},
				inactive_winbar = {},
				extensions = {},
			})
		end,
	},

	{ "nvim-tree/nvim-web-devicons" },
}
