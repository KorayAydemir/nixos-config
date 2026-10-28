return {
	"stevearc/conform.nvim",
	cmd = {
		"ConformInfo",
	},
	keys = {
		{
			"<leader>fr",
			function() require("conform").format({ async = true }) end,
			mode = { "v", "n" },
			desc = "Format buffer",
		},
	},
	-- This will provide type hinting with LuaLS
	---@module "conform"
	---@type conform.setupOpts
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			-- biome in projects with a biome.json, prettierd everywhere else
			javascript = { "biome", "prettierd", stop_after_first = true },
			javascriptreact = { "biome", "prettierd", stop_after_first = true },
			typescript = { "biome", "prettierd", stop_after_first = true },
			typescriptreact = { "biome", "prettierd", stop_after_first = true },
			json = { "biome", "prettierd", stop_after_first = true },
			jsonc = { "biome", "prettierd", stop_after_first = true },
			css = { "biome", "prettierd", stop_after_first = true },
			markdown = { "biome", "prettierd", stop_after_first = true },
			rust = { "rustfmt" },
			toml = { "taplo" },
			go = { "gofmt" },
			-- run on filetypes that don't have any formatters configured
			["_"] = { "prettierd" },
		},
		formatters = {
			-- uses the project's node_modules/.bin/biome; skip when there's no biome.json
			biome = { require_cwd = true },
			prettierd = {
				prepend_args = {
					"--tab-width=4",
					-- "--print-width=100",
                    "--config-precedence=prefer-file",

					"--print-width=120",
					"--experimental-ternaries=true",
                    "--no-bracket-spacing=true"
				},
			},
		},
	},
}
