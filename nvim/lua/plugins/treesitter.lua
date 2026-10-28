return {
    {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").install({ "javascript", "typescript", "tsx", "html", "css", "lua", "regex", "rust", "c", "vimdoc" })
		-- ...same FileType autocmd as before
	end,
},

	{
		"windwp/nvim-ts-autotag",
		event = "VeryLazy",
		opts = {}, -- calls require("nvim-ts-autotag").setup({})
	},

	{
		"nvim-treesitter/nvim-treesitter-context",
		event = "VeryLazy",
		opts = {
			enable = true,
			max_lines = 5,
			min_window_height = 0,
			line_numbers = true,
			multiline_threshold = 1,
			trim_scope = "outer",
			mode = "cursor",
			separator = "",
			zindex = 20,
		},
	},
}
